; DESCRIPTION: Renders a blue box of size 99x92 starting at (75, 94).
; PLAN: r0=75(x), r1=94(y), r2=99(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 94
LDI r2, 99
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
