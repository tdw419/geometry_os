; DESCRIPTION: Composite: Draws a cyan circle centered at (352, 24) with radius 16 then Places a yellow line segment connecting (278, 202) to (182, 88).
; PLAN: r0=352(x), r1=24(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=202(y1), r7=182(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 24
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 202
LDI r7, 182
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
