; DESCRIPTION: Composite: Draws a black rectangle at (288, 2) with width 83 and height 53 then Draws a magenta line from (118, 97) to (445, 47) then Places a yellow dot at position (303, 27).
; PLAN: r0=288(x), r1=2(y), r2=83(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=97(y1), r7=445(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=27(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 2
LDI r2, 83
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 97
LDI r7, 445
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 27
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
