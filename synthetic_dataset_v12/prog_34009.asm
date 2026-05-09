; DESCRIPTION: Renders a blue box of size 96x35 starting at (218, 133).
; PLAN: r0=218(x), r1=133(y), r2=96(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 133
LDI r2, 96
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
