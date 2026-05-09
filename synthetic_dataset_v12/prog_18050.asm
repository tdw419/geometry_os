; DESCRIPTION: Composite: Creates a green circular shape at (42, 137) with radius 32 then Renders a white line between points (338, 121) and (212, 10) then Sets a single black pixel at (465, 48).
; PLAN: r0=42(x), r1=137(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=121(y1), r7=212(x2), r8=10(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=48(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 137
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 121
LDI r7, 212
LDI r8, 10
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 48
LDI r12, 0x000000
PSET r10, r11, r12
HALT
