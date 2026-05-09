; DESCRIPTION: Composite: . Then Places a orange circle of radius 41 at center (213, 186). Then Places a blue line segment connecting (113, 209) to (133, 224).
; PLAN: r0=213(x), r1=186(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=113(x1), r1=209(y1), r2=133(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 41 at center (213, 186).
; PLAN: r0=213(x), r1=186(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 186
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (113, 209) to (133, 224).
; PLAN: r0=113(x1), r1=209(y1), r2=133(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 209
LDI r2, 133
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
