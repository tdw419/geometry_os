; DESCRIPTION: Renders a blue box of size 26x70 starting at (398, 7).
; PLAN: r0=398(x), r1=7(y), r2=26(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 7
LDI r2, 26
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
