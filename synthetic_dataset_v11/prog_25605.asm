; DESCRIPTION: Composite: . Then Renders a cyan disk with center (54, 43) and radius 34. Then Places a red line segment connecting (89, 52) to (218, 61).
; PLAN: r0=54(x), r1=43(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x1), r1=52(y1), r2=218(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (54, 43) and radius 34.
; PLAN: r0=54(x), r1=43(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 43
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (89, 52) to (218, 61).
; PLAN: r0=89(x1), r1=52(y1), r2=218(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 52
LDI r2, 218
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
