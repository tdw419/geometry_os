; DESCRIPTION: Composite: Places a yellow dot at position (356, 124) then Draws a red rectangle at (345, 48) with width 46 and height 54 then Draws a red line from (160, 210) to (43, 159).
; PLAN: r0=356(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=48(y), r7=46(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x1), r11=210(y1), r12=43(x2), r13=159(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 345
LDI r6, 48
LDI r7, 46
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 210
LDI r12, 43
LDI r13, 159
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
