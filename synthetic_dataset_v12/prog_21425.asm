; DESCRIPTION: Composite: Places a red dot at position (451, 57) then Places a red 23x71 rectangle at position (121, 111) then Renders a black line between points (233, 209) and (161, 198).
; PLAN: r0=451(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=111(y), r7=23(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x1), r11=209(y1), r12=161(x2), r13=198(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 111
LDI r7, 23
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 209
LDI r12, 161
LDI r13, 198
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
