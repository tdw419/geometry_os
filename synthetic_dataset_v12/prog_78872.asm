; DESCRIPTION: Places a purple 19x77 rectangle at position (104, 171).
; PLAN: r0=104(x), r1=171(y), r2=19(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 171
LDI r2, 19
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
