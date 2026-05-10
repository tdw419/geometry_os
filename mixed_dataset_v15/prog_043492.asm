; DESCRIPTION: Renders a blue box of size 56x84 starting at (415, 152).
; PLAN: r0=415(x), r1=152(y), r2=56(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 152
LDI r2, 56
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
