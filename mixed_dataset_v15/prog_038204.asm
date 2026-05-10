; DESCRIPTION: Renders a blue box of size 21x96 starting at (198, 62).
; PLAN: r0=198(x), r1=62(y), r2=21(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 62
LDI r2, 21
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
