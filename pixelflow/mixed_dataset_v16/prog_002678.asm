; DESCRIPTION: Composite: Places a cyan line segment connecting (327, 46) to (407, 72) then Renders a red disk with center (456, 174) and radius 54 then Places a green dot at position (334, 16).
; PLAN: r0=327(x1), r1=46(y1), r2=407(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=174(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=16(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 46
LDI r2, 407
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 174
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 16
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
