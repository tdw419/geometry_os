; DESCRIPTION: Places a green 45x104 rectangle at position (336, 61).
; PLAN: r0=336(x), r1=61(y), r2=45(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 61
LDI r2, 45
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
