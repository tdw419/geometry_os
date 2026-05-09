; DESCRIPTION: Composite: Draws a cyan line from (233, 9) to (283, 28) then Draws a red rectangle at (293, 24) with width 33 and height 25 then Renders a cyan disk with center (266, 190) and radius 30.
; PLAN: r0=233(x1), r1=9(y1), r2=283(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=24(y), r7=33(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x), r11=190(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 9
LDI r2, 283
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 24
LDI r7, 33
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 190
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
