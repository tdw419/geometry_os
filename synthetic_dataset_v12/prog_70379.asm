; DESCRIPTION: Composite: Sets a single cyan pixel at (292, 152) then Places a blue line segment connecting (66, 204) to (233, 147) then Draws a red rectangle at (211, 188) with width 71 and height 27.
; PLAN: r0=292(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=204(y1), r7=233(x2), r8=147(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=188(y), r12=71(width), r13=27(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 204
LDI r7, 233
LDI r8, 147
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 188
LDI r12, 71
LDI r13, 27
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
