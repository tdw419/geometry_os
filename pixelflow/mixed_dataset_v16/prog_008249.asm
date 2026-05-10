; DESCRIPTION: Composite: Places a red line segment connecting (290, 162) to (125, 49) then Places a green circle of radius 16 at center (117, 27).
; PLAN: r0=290(x1), r1=162(y1), r2=125(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=27(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 162
LDI r2, 125
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 27
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
