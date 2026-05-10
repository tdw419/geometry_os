; DESCRIPTION: Composite: Draws a green rectangle at (287, 98) with width 77 and height 118 then Places a cyan circle of radius 75 at center (410, 83) then Draws a cyan line from (168, 254) to (432, 243).
; PLAN: r0=287(x), r1=98(y), r2=77(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=83(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x1), r11=254(y1), r12=432(x2), r13=243(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 98
LDI r2, 77
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 83
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 254
LDI r12, 432
LDI r13, 243
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
