; DESCRIPTION: Composite: Renders a green disk with center (110, 58) and radius 57 then Draws a yellow line from (504, 213) to (187, 197).
; PLAN: r0=110(x), r1=58(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x1), r6=213(y1), r7=187(x2), r8=197(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 58
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 213
LDI r7, 187
LDI r8, 197
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
