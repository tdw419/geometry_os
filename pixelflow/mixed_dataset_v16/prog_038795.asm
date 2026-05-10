; DESCRIPTION: Creates a red rectangular region at (51, 131) spanning 113 by 114 pixels.
; PLAN: r0=51(x), r1=131(y), r2=113(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 131
LDI r2, 113
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
