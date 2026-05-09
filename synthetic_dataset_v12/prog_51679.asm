; DESCRIPTION: Places a purple 11x45 rectangle at position (248, 187).
; PLAN: r0=248(x), r1=187(y), r2=11(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 187
LDI r2, 11
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
