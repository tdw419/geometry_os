; DESCRIPTION: Composite: Draws a red line from (504, 169) to (138, 67) then Draws a green circle centered at (380, 154) with radius 46.
; PLAN: r0=504(x1), r1=169(y1), r2=138(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=154(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 169
LDI r2, 138
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 154
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
