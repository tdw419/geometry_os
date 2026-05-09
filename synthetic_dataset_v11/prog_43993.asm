; DESCRIPTION: Composite: . Then Places a white dot at position (70, 129). Then Places a purple 78x72 rectangle at position (115, 106).
; PLAN: r0=70(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=106(y), r2=78(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (70, 129).
; PLAN: r0=70(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple 78x72 rectangle at position (115, 106).
; PLAN: r0=115(x), r1=106(y), r2=78(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 106
LDI r2, 78
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
