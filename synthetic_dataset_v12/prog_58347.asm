; DESCRIPTION: Composite: Creates a white rectangular region at (170, 27) spanning 45 by 38 pixels then Renders a cyan line between points (340, 36) and (411, 58).
; PLAN: r0=170(x), r1=27(y), r2=45(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=36(y1), r7=411(x2), r8=58(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 27
LDI r2, 45
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 36
LDI r7, 411
LDI r8, 58
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
