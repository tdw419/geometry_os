; DESCRIPTION: Places a red 60x66 rectangle at position (437, 159).
; PLAN: r0=437(x), r1=159(y), r2=60(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 159
LDI r2, 60
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
