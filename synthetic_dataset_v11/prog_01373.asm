; DESCRIPTION: Composite: . Then Renders a white line between points (0, 225) and (86, 119). Then Places a purple 88x94 rectangle at position (143, 14).
; PLAN: r0=0(x1), r1=225(y1), r2=86(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=14(y), r2=88(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (0, 225) and (86, 119).
; PLAN: r0=0(x1), r1=225(y1), r2=86(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 225
LDI r2, 86
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 88x94 rectangle at position (143, 14).
; PLAN: r0=143(x), r1=14(y), r2=88(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 14
LDI r2, 88
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
