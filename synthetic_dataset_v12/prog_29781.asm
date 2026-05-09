; DESCRIPTION: Composite: Draws a red circle centered at (236, 154) with radius 74 then Places a red line segment connecting (396, 135) to (87, 213).
; PLAN: r0=236(x), r1=154(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=135(y1), r7=87(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 154
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 135
LDI r7, 87
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
