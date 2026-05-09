; DESCRIPTION: Places a purple 107x14 rectangle at position (268, 215).
; PLAN: r0=268(x), r1=215(y), r2=107(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 215
LDI r2, 107
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
