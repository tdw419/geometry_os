; DESCRIPTION: Creates a red rectangular region at (362, 131) spanning 114 by 113 pixels.
; PLAN: r0=362(x), r1=131(y), r2=114(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 131
LDI r2, 114
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
