; DESCRIPTION: Places a white 47x110 rectangle at position (98, 118).
; PLAN: r0=98(x), r1=118(y), r2=47(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 118
LDI r2, 47
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
