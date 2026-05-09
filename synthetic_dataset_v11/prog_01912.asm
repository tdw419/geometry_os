; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (208, 63) to (16, 55). Then Draws a orange circle centered at (91, 174) with radius 61.
; PLAN: r0=208(x1), r1=63(y1), r2=16(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=174(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (208, 63) to (16, 55).
; PLAN: r0=208(x1), r1=63(y1), r2=16(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 63
LDI r2, 16
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (91, 174) with radius 61.
; PLAN: r0=91(x), r1=174(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 174
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
