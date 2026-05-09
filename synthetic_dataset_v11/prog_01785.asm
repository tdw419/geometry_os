; DESCRIPTION: Renders a white box of size 90x14 starting at (60, 155).
; PLAN: r0=60(x), r1=155(y), r2=90(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 155
LDI r2, 90
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
