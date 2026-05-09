; DESCRIPTION: Composite: . Then Places a white 67x84 rectangle at position (65, 86). Then Places a black line segment connecting (177, 77) to (91, 162).
; PLAN: r0=65(x), r1=86(y), r2=67(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=77(y1), r2=91(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 67x84 rectangle at position (65, 86).
; PLAN: r0=65(x), r1=86(y), r2=67(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 86
LDI r2, 67
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (177, 77) to (91, 162).
; PLAN: r0=177(x1), r1=77(y1), r2=91(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 77
LDI r2, 91
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
