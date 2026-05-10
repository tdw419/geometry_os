; DESCRIPTION: Composite: Renders a cyan line between points (321, 131) and (3, 138) then Draws a yellow rectangle at (340, 55) with width 89 and height 71.
; PLAN: r0=321(x1), r1=131(y1), r2=3(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=55(y), r7=89(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 131
LDI r2, 3
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 55
LDI r7, 89
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
