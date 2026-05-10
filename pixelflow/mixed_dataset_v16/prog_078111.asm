; DESCRIPTION: Composite: Places a white circle of radius 36 at center (328, 134) then Renders a cyan line between points (191, 60) and (460, 209) then Places a orange dot at position (287, 123).
; PLAN: r0=328(x), r1=134(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=60(y1), r7=460(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=123(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 134
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 60
LDI r7, 460
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 123
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
