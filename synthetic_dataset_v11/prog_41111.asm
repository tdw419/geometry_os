; DESCRIPTION: Composite: . Then Places a cyan 74x18 rectangle at position (104, 118). Then Renders a cyan line between points (244, 84) and (36, 106).
; PLAN: r0=104(x), r1=118(y), r2=74(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=244(x1), r1=84(y1), r2=36(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 74x18 rectangle at position (104, 118).
; PLAN: r0=104(x), r1=118(y), r2=74(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 118
LDI r2, 74
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (244, 84) and (36, 106).
; PLAN: r0=244(x1), r1=84(y1), r2=36(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 84
LDI r2, 36
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
