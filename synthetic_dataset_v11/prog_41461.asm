; DESCRIPTION: Composite: . Then Places a purple 84x62 rectangle at position (150, 107). Then Renders a purple line between points (83, 77) and (158, 142).
; PLAN: r0=150(x), r1=107(y), r2=84(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=83(x1), r1=77(y1), r2=158(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 84x62 rectangle at position (150, 107).
; PLAN: r0=150(x), r1=107(y), r2=84(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 107
LDI r2, 84
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (83, 77) and (158, 142).
; PLAN: r0=83(x1), r1=77(y1), r2=158(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 77
LDI r2, 158
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
