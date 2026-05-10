; DESCRIPTION: Composite: Places a black circle of radius 27 at center (329, 63) then Renders a green line between points (164, 200) and (102, 134).
; PLAN: r0=329(x), r1=63(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x1), r6=200(y1), r7=102(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 63
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 200
LDI r7, 102
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
