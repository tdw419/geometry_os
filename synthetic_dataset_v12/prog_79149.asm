; DESCRIPTION: Places a black 118x98 rectangle at position (297, 86).
; PLAN: r0=297(x), r1=86(y), r2=118(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 86
LDI r2, 118
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
