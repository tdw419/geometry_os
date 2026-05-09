; DESCRIPTION: Renders a blue box of size 94x13 starting at (146, 22).
; PLAN: r0=146(x), r1=22(y), r2=94(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 22
LDI r2, 94
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
