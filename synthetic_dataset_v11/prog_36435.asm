; DESCRIPTION: Composite: . Then Renders a yellow line between points (85, 47) and (224, 54). Then Renders a red disk with center (174, 104) and radius 70.
; PLAN: r0=85(x1), r1=47(y1), r2=224(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=104(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (85, 47) and (224, 54).
; PLAN: r0=85(x1), r1=47(y1), r2=224(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 47
LDI r2, 224
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (174, 104) and radius 70.
; PLAN: r0=174(x), r1=104(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 104
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
