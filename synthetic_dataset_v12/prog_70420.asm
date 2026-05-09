; DESCRIPTION: Composite: Places a cyan circle of radius 43 at center (291, 156) then Renders a white line between points (149, 220) and (212, 187).
; PLAN: r0=291(x), r1=156(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x1), r6=220(y1), r7=212(x2), r8=187(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 156
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 220
LDI r7, 212
LDI r8, 187
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
