; DESCRIPTION: Places a white 70x47 rectangle at position (352, 51).
; PLAN: r0=352(x), r1=51(y), r2=70(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 51
LDI r2, 70
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
