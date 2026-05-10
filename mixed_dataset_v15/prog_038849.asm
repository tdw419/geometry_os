; DESCRIPTION: Composite: Sets a single black pixel at (200, 231) then Renders a cyan disk with center (270, 82) and radius 45 then Renders a white line between points (286, 242) and (179, 153).
; PLAN: r0=200(x), r1=231(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=82(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=242(y1), r12=179(x2), r13=153(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 231
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 270
LDI r6, 82
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 242
LDI r12, 179
LDI r13, 153
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
