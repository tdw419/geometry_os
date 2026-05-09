; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (20, 188) to (209, 222). Then Places a orange dot at position (186, 174).
; PLAN: r0=20(x1), r1=188(y1), r2=209(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=186(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (20, 188) to (209, 222).
; PLAN: r0=20(x1), r1=188(y1), r2=209(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 188
LDI r2, 209
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (186, 174).
; PLAN: r0=186(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
