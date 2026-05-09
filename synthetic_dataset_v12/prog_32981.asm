; DESCRIPTION: Composite: Creates a green circular shape at (310, 76) with radius 69 then Sets a single orange pixel at (428, 190) then Renders a cyan line between points (169, 221) and (239, 107).
; PLAN: r0=310(x), r1=76(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=190(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=169(x1), r11=221(y1), r12=239(x2), r13=107(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 76
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 190
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 169
LDI r11, 221
LDI r12, 239
LDI r13, 107
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
