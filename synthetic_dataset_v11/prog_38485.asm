; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (41, 239) to (110, 243). Then Places a white circle of radius 52 at center (165, 100).
; PLAN: r0=41(x1), r1=239(y1), r2=110(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=100(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (41, 239) to (110, 243).
; PLAN: r0=41(x1), r1=239(y1), r2=110(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 239
LDI r2, 110
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 52 at center (165, 100).
; PLAN: r0=165(x), r1=100(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 100
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
