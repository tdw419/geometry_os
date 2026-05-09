; DESCRIPTION: Composite: . Then Places a yellow circle of radius 46 at center (130, 117). Then Places a orange line segment connecting (87, 239) to (214, 98).
; PLAN: r0=130(x), r1=117(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x1), r1=239(y1), r2=214(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 46 at center (130, 117).
; PLAN: r0=130(x), r1=117(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 117
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (87, 239) to (214, 98).
; PLAN: r0=87(x1), r1=239(y1), r2=214(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 239
LDI r2, 214
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
