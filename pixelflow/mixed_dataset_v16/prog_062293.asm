; DESCRIPTION: Places a white 51x100 rectangle at position (74, 77).
; PLAN: r0=74(x), r1=77(y), r2=51(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 77
LDI r2, 51
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
