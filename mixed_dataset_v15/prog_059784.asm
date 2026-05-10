; DESCRIPTION: Composite: Places a yellow dot at position (368, 247) then Draws a blue rectangle at (209, 83) with width 117 and height 83 then Draws a cyan line from (213, 19) to (324, 182).
; PLAN: r0=368(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=83(y), r7=117(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x1), r11=19(y1), r12=324(x2), r13=182(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 209
LDI r6, 83
LDI r7, 117
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 19
LDI r12, 324
LDI r13, 182
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
