; DESCRIPTION: Composite: Draws a green line from (493, 179) to (277, 7) then Renders a purple disk with center (208, 129) and radius 57 then Places a red 104x63 rectangle at position (230, 23).
; PLAN: r0=493(x1), r1=179(y1), r2=277(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=129(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=23(y), r12=104(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 179
LDI r2, 277
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 129
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 23
LDI r12, 104
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
