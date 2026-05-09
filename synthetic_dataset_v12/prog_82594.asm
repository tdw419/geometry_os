; DESCRIPTION: Composite: Sets a single blue pixel at (154, 144) then Draws a green line from (73, 127) to (388, 187) then Places a red 101x90 rectangle at position (33, 32).
; PLAN: r0=154(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=127(y1), r7=388(x2), r8=187(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=32(y), r12=101(width), r13=90(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 127
LDI r7, 388
LDI r8, 187
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 32
LDI r12, 101
LDI r13, 90
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
