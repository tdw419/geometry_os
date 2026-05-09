; DESCRIPTION: Composite: . Then Places a green circle of radius 45 at center (104, 91). Then Draws a orange line from (217, 40) to (253, 47).
; PLAN: r0=104(x), r1=91(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=217(x1), r1=40(y1), r2=253(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 45 at center (104, 91).
; PLAN: r0=104(x), r1=91(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 91
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (217, 40) to (253, 47).
; PLAN: r0=217(x1), r1=40(y1), r2=253(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 40
LDI r2, 253
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
