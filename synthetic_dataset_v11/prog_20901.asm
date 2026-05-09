; DESCRIPTION: Composite: . Then Places a yellow circle of radius 22 at center (81, 145). Then Places a cyan line segment connecting (234, 215) to (178, 140).
; PLAN: r0=81(x), r1=145(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=234(x1), r1=215(y1), r2=178(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 22 at center (81, 145).
; PLAN: r0=81(x), r1=145(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 145
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (234, 215) to (178, 140).
; PLAN: r0=234(x1), r1=215(y1), r2=178(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 215
LDI r2, 178
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
