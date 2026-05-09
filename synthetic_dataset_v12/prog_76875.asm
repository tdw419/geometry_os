; DESCRIPTION: Composite: Draws a yellow rectangle at (191, 36) with width 19 and height 74 then Places a red line segment connecting (80, 214) to (387, 39) then Sets a single green pixel at (88, 139).
; PLAN: r0=191(x), r1=36(y), r2=19(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=214(y1), r7=387(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=139(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 36
LDI r2, 19
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 214
LDI r7, 387
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 139
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
