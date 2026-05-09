; DESCRIPTION: Renders a blue box of size 48x11 starting at (305, 219).
; PLAN: r0=305(x), r1=219(y), r2=48(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 219
LDI r2, 48
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
