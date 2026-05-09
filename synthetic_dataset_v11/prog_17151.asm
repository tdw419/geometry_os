; DESCRIPTION: Composite: . Then Renders a purple line between points (157, 218) and (195, 198). Then Places a cyan 41x31 rectangle at position (131, 116).
; PLAN: r0=157(x1), r1=218(y1), r2=195(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=116(y), r2=41(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (157, 218) and (195, 198).
; PLAN: r0=157(x1), r1=218(y1), r2=195(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 218
LDI r2, 195
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 41x31 rectangle at position (131, 116).
; PLAN: r0=131(x), r1=116(y), r2=41(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 116
LDI r2, 41
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
