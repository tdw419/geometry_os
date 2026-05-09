; DESCRIPTION: Renders a blue box of size 99x75 starting at (263, 163).
; PLAN: r0=263(x), r1=163(y), r2=99(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 163
LDI r2, 99
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
