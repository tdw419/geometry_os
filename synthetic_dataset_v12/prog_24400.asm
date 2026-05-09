; DESCRIPTION: Composite: Draws a orange line from (456, 148) to (374, 245) then Places a red circle of radius 50 at center (167, 94) then Places a cyan dot at position (227, 15).
; PLAN: r0=456(x1), r1=148(y1), r2=374(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=94(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=15(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 148
LDI r2, 374
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 94
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 15
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
