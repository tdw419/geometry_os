; DESCRIPTION: Composite: Draws a red rectangle at (347, 168) with width 98 and height 76 then Renders a black line between points (305, 97) and (217, 229) then Places a magenta dot at position (245, 69).
; PLAN: r0=347(x), r1=168(y), r2=98(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x1), r6=97(y1), r7=217(x2), r8=229(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=69(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 168
LDI r2, 98
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 97
LDI r7, 217
LDI r8, 229
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 69
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
