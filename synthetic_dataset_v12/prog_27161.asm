; DESCRIPTION: Composite: Sets a single cyan pixel at (436, 249) then Draws a green rectangle at (19, 59) with width 20 and height 14 then Renders a orange line between points (305, 223) and (508, 7).
; PLAN: r0=436(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=59(y), r7=20(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x1), r11=223(y1), r12=508(x2), r13=7(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 59
LDI r7, 20
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 223
LDI r12, 508
LDI r13, 7
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
