; DESCRIPTION: Composite: Sets a single cyan pixel at (153, 102) then Draws a cyan rectangle at (254, 136) with width 18 and height 40 then Draws a blue line from (27, 204) to (358, 39).
; PLAN: r0=153(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=136(y), r7=18(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=27(x1), r11=204(y1), r12=358(x2), r13=39(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 136
LDI r7, 18
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 204
LDI r12, 358
LDI r13, 39
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
