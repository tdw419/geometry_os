; DESCRIPTION: Composite: . Then Places a orange line segment connecting (233, 105) to (36, 98). Then Places a purple 47x30 rectangle at position (125, 29).
; PLAN: r0=233(x1), r1=105(y1), r2=36(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=29(y), r2=47(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (233, 105) to (36, 98).
; PLAN: r0=233(x1), r1=105(y1), r2=36(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 105
LDI r2, 36
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 47x30 rectangle at position (125, 29).
; PLAN: r0=125(x), r1=29(y), r2=47(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 29
LDI r2, 47
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
