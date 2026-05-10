; DESCRIPTION: Composite: Renders a cyan line between points (466, 220) and (254, 135) then Renders a yellow disk with center (162, 33) and radius 33.
; PLAN: r0=466(x1), r1=220(y1), r2=254(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=33(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 220
LDI r2, 254
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 33
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
