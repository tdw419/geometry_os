; DESCRIPTION: Renders a yellow box of size 18x42 starting at (345, 97).
; PLAN: r0=345(x), r1=97(y), r2=18(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 97
LDI r2, 18
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
