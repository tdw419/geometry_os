; DESCRIPTION: Renders a green box of size 10x42 starting at (10, 44).
; PLAN: r0=10(x), r1=44(y), r2=10(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 44
LDI r2, 10
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
