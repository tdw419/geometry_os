; DESCRIPTION: Renders a white box of size 67x51 starting at (327, 77).
; PLAN: r0=327(x), r1=77(y), r2=67(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 77
LDI r2, 67
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
