; DESCRIPTION: Composite: Renders a cyan line between points (341, 210) and (185, 35) then Renders a white box of size 59x80 starting at (65, 102).
; PLAN: r0=341(x1), r1=210(y1), r2=185(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=102(y), r7=59(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 210
LDI r2, 185
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 102
LDI r7, 59
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
