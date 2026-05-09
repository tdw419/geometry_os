; DESCRIPTION: Places a purple 41x104 rectangle at position (422, 141).
; PLAN: r0=422(x), r1=141(y), r2=41(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 141
LDI r2, 41
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
