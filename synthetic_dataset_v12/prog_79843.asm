; DESCRIPTION: Composite: Places a cyan dot at position (23, 156) then Renders a yellow disk with center (388, 96) and radius 71 then Places a white line segment connecting (397, 47) to (306, 169).
; PLAN: r0=23(x), r1=156(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=96(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x1), r11=47(y1), r12=306(x2), r13=169(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 156
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 96
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 47
LDI r12, 306
LDI r13, 169
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
