; DESCRIPTION: Renders a blue box of size 94x33 starting at (21, 80).
; PLAN: r0=21(x), r1=80(y), r2=94(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 80
LDI r2, 94
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
