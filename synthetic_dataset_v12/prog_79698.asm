; DESCRIPTION: Renders a blue box of size 94x16 starting at (1, 237).
; PLAN: r0=1(x), r1=237(y), r2=94(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 237
LDI r2, 94
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
