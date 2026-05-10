; DESCRIPTION: Composite: Places a red dot at position (154, 144) then Draws a orange rectangle at (59, 23) with width 72 and height 28 then Draws a blue line from (61, 211) to (461, 150).
; PLAN: r0=154(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=23(y), r7=72(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x1), r11=211(y1), r12=461(x2), r13=150(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 23
LDI r7, 72
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 211
LDI r12, 461
LDI r13, 150
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
