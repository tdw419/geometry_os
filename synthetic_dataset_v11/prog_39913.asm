; DESCRIPTION: Composite: . Then Renders a white line between points (33, 145) and (26, 179). Then Places a black 104x85 rectangle at position (21, 80).
; PLAN: r0=33(x1), r1=145(y1), r2=26(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=80(y), r2=104(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (33, 145) and (26, 179).
; PLAN: r0=33(x1), r1=145(y1), r2=26(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 145
LDI r2, 26
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 104x85 rectangle at position (21, 80).
; PLAN: r0=21(x), r1=80(y), r2=104(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 80
LDI r2, 104
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
