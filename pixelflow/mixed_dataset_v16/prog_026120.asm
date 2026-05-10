; DESCRIPTION: Composite: Draws a red rectangle at (328, 99) with width 18 and height 55 then Renders a green line between points (313, 145) and (377, 184) then Places a cyan dot at position (264, 229).
; PLAN: r0=328(x), r1=99(y), r2=18(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=145(y1), r7=377(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=229(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 99
LDI r2, 18
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 145
LDI r7, 377
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 229
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
