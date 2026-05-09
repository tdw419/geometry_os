; DESCRIPTION: Renders a blue box of size 104x26 starting at (206, 181).
; PLAN: r0=206(x), r1=181(y), r2=104(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 181
LDI r2, 104
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
