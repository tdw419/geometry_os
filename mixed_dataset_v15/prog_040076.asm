; DESCRIPTION: Composite: Sets a single purple pixel at (29, 68) then Draws a red rectangle at (216, 86) with width 46 and height 117 then Draws a cyan line from (199, 6) to (39, 198).
; PLAN: r0=29(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=86(y), r7=46(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x1), r11=6(y1), r12=39(x2), r13=198(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 216
LDI r6, 86
LDI r7, 46
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 6
LDI r12, 39
LDI r13, 198
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
