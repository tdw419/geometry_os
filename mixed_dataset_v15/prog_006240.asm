; DESCRIPTION: Composite: Places a yellow dot at position (96, 6) then Places a yellow 74x38 rectangle at position (363, 151) then Places a white line segment connecting (189, 183) to (314, 92).
; PLAN: r0=96(x), r1=6(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=151(y), r7=74(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x1), r11=183(y1), r12=314(x2), r13=92(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 6
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 363
LDI r6, 151
LDI r7, 74
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 183
LDI r12, 314
LDI r13, 92
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
