; DESCRIPTION: Composite: . Then Places a orange circle of radius 60 at center (130, 137). Then Places a cyan line segment connecting (174, 140) to (234, 75).
; PLAN: r0=130(x), r1=137(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x1), r1=140(y1), r2=234(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 60 at center (130, 137).
; PLAN: r0=130(x), r1=137(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 137
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (174, 140) to (234, 75).
; PLAN: r0=174(x1), r1=140(y1), r2=234(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 140
LDI r2, 234
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
