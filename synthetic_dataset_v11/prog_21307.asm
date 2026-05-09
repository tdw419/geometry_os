; DESCRIPTION: Renders a blue box of size 55x84 starting at (173, 117).
; PLAN: r0=173(x), r1=117(y), r2=55(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 117
LDI r2, 55
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
