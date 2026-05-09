; DESCRIPTION: Composite: Renders a cyan disk with center (419, 91) and radius 59 then Draws a yellow line from (301, 104) to (155, 221) then Places a yellow 18x98 rectangle at position (277, 67).
; PLAN: r0=419(x), r1=91(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=104(y1), r7=155(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=67(y), r12=18(width), r13=98(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 91
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 104
LDI r7, 155
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 67
LDI r12, 18
LDI r13, 98
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
