; DESCRIPTION: Places a white 113x104 rectangle at position (358, 35).
; PLAN: r0=358(x), r1=35(y), r2=113(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 35
LDI r2, 113
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
