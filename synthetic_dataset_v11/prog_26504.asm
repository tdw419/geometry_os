; DESCRIPTION: Composite: . Then Creates a black circular shape at (212, 223) with radius 14. Then Places a cyan line segment connecting (245, 83) to (18, 133).
; PLAN: r0=212(x), r1=223(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=245(x1), r1=83(y1), r2=18(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (212, 223) with radius 14.
; PLAN: r0=212(x), r1=223(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 223
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (245, 83) to (18, 133).
; PLAN: r0=245(x1), r1=83(y1), r2=18(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 18
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
