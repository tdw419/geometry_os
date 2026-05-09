; DESCRIPTION: Renders a white box of size 26x51 starting at (117, 187).
; PLAN: r0=117(x), r1=187(y), r2=26(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 187
LDI r2, 26
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
