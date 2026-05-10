; DESCRIPTION: Composite: Renders a blue disk with center (284, 187) and radius 42 then Draws a green rectangle at (229, 215) with width 46 and height 40 then Draws a blue line from (404, 74) to (262, 185).
; PLAN: r0=284(x), r1=187(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=215(y), r7=46(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x1), r11=74(y1), r12=262(x2), r13=185(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 187
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 215
LDI r7, 46
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 74
LDI r12, 262
LDI r13, 185
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
