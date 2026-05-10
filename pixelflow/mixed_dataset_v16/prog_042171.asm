; DESCRIPTION: Composite: Creates a white circular shape at (271, 178) with radius 62 then Draws a red line from (272, 108) to (380, 218) then Places a green dot at position (161, 19).
; PLAN: r0=271(x), r1=178(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=108(y1), r7=380(x2), r8=218(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 178
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 108
LDI r7, 380
LDI r8, 218
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
