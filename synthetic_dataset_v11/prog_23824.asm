; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (137, 186) to (121, 240). Then Creates a yellow circular shape at (202, 70) with radius 31.
; PLAN: r0=137(x1), r1=186(y1), r2=121(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=202(x), r1=70(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (137, 186) to (121, 240).
; PLAN: r0=137(x1), r1=186(y1), r2=121(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 186
LDI r2, 121
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (202, 70) with radius 31.
; PLAN: r0=202(x), r1=70(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 70
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
