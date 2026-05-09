; DESCRIPTION: Composite: Draws a magenta line from (446, 34) to (284, 46) then Draws a green rectangle at (394, 147) with width 85 and height 63 then Places a magenta circle of radius 38 at center (146, 204).
; PLAN: r0=446(x1), r1=34(y1), r2=284(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=147(y), r7=85(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=204(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 34
LDI r2, 284
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 147
LDI r7, 85
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 204
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
