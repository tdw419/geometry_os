; DESCRIPTION: Composite: Renders a orange disk with center (364, 127) and radius 74 then Places a black 59x100 rectangle at position (299, 32) then Draws a magenta line from (127, 146) to (123, 164).
; PLAN: r0=364(x), r1=127(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=32(y), r7=59(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=146(y1), r12=123(x2), r13=164(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 127
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 32
LDI r7, 59
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 146
LDI r12, 123
LDI r13, 164
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
