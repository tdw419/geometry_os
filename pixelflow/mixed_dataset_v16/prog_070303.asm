; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (316, 96) then Places a black line segment connecting (37, 184) to (38, 236).
; PLAN: r0=316(x), r1=96(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x1), r6=184(y1), r7=38(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 96
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 184
LDI r7, 38
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
