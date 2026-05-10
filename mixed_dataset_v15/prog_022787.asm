; DESCRIPTION: Composite: Places a cyan line segment connecting (194, 97) to (303, 98) then Places a orange dot at position (53, 242) then Places a cyan circle of radius 41 at center (169, 46).
; PLAN: r0=194(x1), r1=97(y1), r2=303(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=46(y), r12=41(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 97
LDI r2, 303
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 169
LDI r11, 46
LDI r12, 41
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
