; DESCRIPTION: Composite: Renders a red disk with center (342, 59) and radius 34 then Draws a white rectangle at (363, 21) with width 18 and height 36.
; PLAN: r0=342(x), r1=59(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=21(y), r7=18(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 59
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 21
LDI r7, 18
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
