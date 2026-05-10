; DESCRIPTION: Composite: Renders a purple box of size 58x34 starting at (439, 165) then Places a magenta dot at position (225, 166) then Draws a magenta line from (273, 196) to (178, 246).
; PLAN: r0=439(x), r1=165(y), r2=58(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=166(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=273(x1), r11=196(y1), r12=178(x2), r13=246(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 165
LDI r2, 58
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 166
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 196
LDI r12, 178
LDI r13, 246
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
