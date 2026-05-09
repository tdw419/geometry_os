; DESCRIPTION: Composite: Draws a red line from (129, 20) to (273, 205) then Places a green dot at position (264, 73) then Renders a cyan disk with center (71, 168) and radius 54.
; PLAN: r0=129(x1), r1=20(y1), r2=273(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=73(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=71(x), r11=168(y), r12=54(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 20
LDI r2, 273
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 73
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 71
LDI r11, 168
LDI r12, 54
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
