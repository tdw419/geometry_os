; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (50, 17) to (72, 126). Then Places a white circle of radius 45 at center (188, 56).
; PLAN: r0=50(x1), r1=17(y1), r2=72(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=188(x), r1=56(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (50, 17) to (72, 126).
; PLAN: r0=50(x1), r1=17(y1), r2=72(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 17
LDI r2, 72
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 45 at center (188, 56).
; PLAN: r0=188(x), r1=56(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 56
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
