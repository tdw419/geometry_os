; DESCRIPTION: Composite: . Then Places a purple 89x34 rectangle at position (136, 85). Then Draws a green line from (44, 163) to (150, 55).
; PLAN: r0=136(x), r1=85(y), r2=89(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=44(x1), r1=163(y1), r2=150(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 89x34 rectangle at position (136, 85).
; PLAN: r0=136(x), r1=85(y), r2=89(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 85
LDI r2, 89
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (44, 163) to (150, 55).
; PLAN: r0=44(x1), r1=163(y1), r2=150(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 163
LDI r2, 150
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
