; DESCRIPTION: Composite: Places a green circle of radius 29 at center (261, 47) then Renders a yellow line between points (146, 154) and (492, 5).
; PLAN: r0=261(x), r1=47(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=154(y1), r7=492(x2), r8=5(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 47
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 154
LDI r7, 492
LDI r8, 5
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
