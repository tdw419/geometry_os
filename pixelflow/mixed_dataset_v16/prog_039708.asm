; DESCRIPTION: Places a black 47x35 rectangle at position (400, 178).
; PLAN: r0=400(x), r1=178(y), r2=47(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 178
LDI r2, 47
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
