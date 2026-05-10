; DESCRIPTION: Places a white 60x37 box at position (110, 38).
; PLAN: r0=110(x), r1=38(y), r2=60(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 38
LDI r2, 60
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
