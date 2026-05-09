; DESCRIPTION: Composite: Renders a cyan line between points (248, 84) and (332, 143) then Draws a white circle centered at (286, 168) with radius 50.
; PLAN: r0=248(x1), r1=84(y1), r2=332(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=168(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 84
LDI r2, 332
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 168
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
