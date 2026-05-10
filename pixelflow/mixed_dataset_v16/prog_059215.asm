; DESCRIPTION: Composite: Places a white dot at position (49, 36) then Renders a cyan line between points (123, 15) and (73, 154) then Renders a cyan disk with center (375, 73) and radius 52.
; PLAN: r0=49(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=15(y1), r7=73(x2), r8=154(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=73(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 15
LDI r7, 73
LDI r8, 154
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 73
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
