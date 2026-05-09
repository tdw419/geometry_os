; DESCRIPTION: Places a white 62x110 rectangle at position (77, 118).
; PLAN: r0=77(x), r1=118(y), r2=62(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 118
LDI r2, 62
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
