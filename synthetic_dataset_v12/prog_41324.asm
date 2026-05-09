; DESCRIPTION: Renders a white box of size 51x15 starting at (313, 157).
; PLAN: r0=313(x), r1=157(y), r2=51(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 157
LDI r2, 51
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
