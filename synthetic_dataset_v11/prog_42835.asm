; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (157, 148) to (173, 204). Then Renders a orange disk with center (79, 107) and radius 43.
; PLAN: r0=157(x1), r1=148(y1), r2=173(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=107(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (157, 148) to (173, 204).
; PLAN: r0=157(x1), r1=148(y1), r2=173(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 148
LDI r2, 173
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (79, 107) and radius 43.
; PLAN: r0=79(x), r1=107(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 107
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
