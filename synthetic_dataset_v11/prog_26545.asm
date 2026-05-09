; DESCRIPTION: Composite: . Then Places a green line segment connecting (220, 4) to (222, 95). Then Places a cyan circle of radius 18 at center (94, 214).
; PLAN: r0=220(x1), r1=4(y1), r2=222(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=214(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (220, 4) to (222, 95).
; PLAN: r0=220(x1), r1=4(y1), r2=222(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 4
LDI r2, 222
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 18 at center (94, 214).
; PLAN: r0=94(x), r1=214(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 214
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
