; DESCRIPTION: Composite: . Then Places a green line segment connecting (171, 226) to (199, 27). Then Renders a green disk with center (198, 132) and radius 55.
; PLAN: r0=171(x1), r1=226(y1), r2=199(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=198(x), r1=132(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (171, 226) to (199, 27).
; PLAN: r0=171(x1), r1=226(y1), r2=199(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 226
LDI r2, 199
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (198, 132) and radius 55.
; PLAN: r0=198(x), r1=132(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 132
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
