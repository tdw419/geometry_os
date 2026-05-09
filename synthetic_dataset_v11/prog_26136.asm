; DESCRIPTION: Renders a white box of size 51x39 starting at (116, 40).
; PLAN: r0=116(x), r1=40(y), r2=51(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 40
LDI r2, 51
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
