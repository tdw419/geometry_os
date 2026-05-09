; DESCRIPTION: Renders a yellow box of size 94x66 starting at (42, 132).
; PLAN: r0=42(x), r1=132(y), r2=94(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 132
LDI r2, 94
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
