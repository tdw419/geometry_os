; DESCRIPTION: Composite: Draws a green circle centered at (88, 48) with radius 34 then Draws a red line from (16, 210) to (469, 161).
; PLAN: r0=88(x), r1=48(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x1), r6=210(y1), r7=469(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 48
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 210
LDI r7, 469
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
