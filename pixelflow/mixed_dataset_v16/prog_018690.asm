; DESCRIPTION: Composite: Renders a orange box of size 56x28 starting at (120, 125) then Renders a red disk with center (257, 188) and radius 34 then Draws a green line from (415, 220) to (16, 154).
; PLAN: r0=120(x), r1=125(y), r2=56(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=188(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x1), r11=220(y1), r12=16(x2), r13=154(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 125
LDI r2, 56
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 188
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 220
LDI r12, 16
LDI r13, 154
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
