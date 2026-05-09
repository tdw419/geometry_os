; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (215, 186) to (199, 51). Then Creates a green circular shape at (202, 198) with radius 26.
; PLAN: r0=215(x1), r1=186(y1), r2=199(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=202(x), r1=198(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (215, 186) to (199, 51).
; PLAN: r0=215(x1), r1=186(y1), r2=199(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 186
LDI r2, 199
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (202, 198) with radius 26.
; PLAN: r0=202(x), r1=198(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 198
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
