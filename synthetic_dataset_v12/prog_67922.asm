; DESCRIPTION: Places a red 60x65 rectangle at position (351, 8).
; PLAN: r0=351(x), r1=8(y), r2=60(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 8
LDI r2, 60
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
