; DESCRIPTION: Composite: Places a yellow dot at position (362, 166) then Places a red 115x52 rectangle at position (156, 73) then Draws a blue line from (204, 201) to (433, 169).
; PLAN: r0=362(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=73(y), r7=115(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x1), r11=201(y1), r12=433(x2), r13=169(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 166
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 156
LDI r6, 73
LDI r7, 115
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 201
LDI r12, 433
LDI r13, 169
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
