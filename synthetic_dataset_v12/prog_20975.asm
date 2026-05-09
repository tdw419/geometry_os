; DESCRIPTION: Composite: Draws a white circle centered at (244, 170) with radius 41 then Renders a green line between points (236, 190) and (227, 38) then Places a cyan dot at position (76, 146).
; PLAN: r0=244(x), r1=170(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x1), r6=190(y1), r7=227(x2), r8=38(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=146(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 170
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 190
LDI r7, 227
LDI r8, 38
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 146
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
