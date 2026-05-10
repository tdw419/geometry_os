; DESCRIPTION: Composite: Places a yellow circle of radius 62 at center (370, 91) then Renders a green line between points (64, 143) and (214, 0).
; PLAN: r0=370(x), r1=91(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=143(y1), r7=214(x2), r8=0(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 91
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 143
LDI r7, 214
LDI r8, 0
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
