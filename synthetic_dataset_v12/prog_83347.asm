; DESCRIPTION: Composite: Renders a green box of size 80x60 starting at (117, 172) then Places a blue dot at position (221, 198) then Draws a cyan line from (255, 208) to (96, 247).
; PLAN: r0=117(x), r1=172(y), r2=80(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=255(x1), r11=208(y1), r12=96(x2), r13=247(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 172
LDI r2, 80
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 208
LDI r12, 96
LDI r13, 247
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
