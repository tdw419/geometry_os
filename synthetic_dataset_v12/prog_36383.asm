; DESCRIPTION: Places a purple 30x107 rectangle at position (352, 141).
; PLAN: r0=352(x), r1=141(y), r2=30(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 141
LDI r2, 30
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
