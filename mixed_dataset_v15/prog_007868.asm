; DESCRIPTION: Composite: Sets a single cyan pixel at (241, 154) then Places a white circle of radius 50 at center (352, 161) then Draws a green line from (158, 161) to (229, 134).
; PLAN: r0=241(x), r1=154(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=161(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x1), r11=161(y1), r12=229(x2), r13=134(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 154
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 161
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 161
LDI r12, 229
LDI r13, 134
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
