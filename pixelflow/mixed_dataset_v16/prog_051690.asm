; DESCRIPTION: Composite: Renders a white disk with center (450, 205) and radius 29 then Places a blue line segment connecting (320, 0) to (406, 34) then Places a orange 34x32 rectangle at position (323, 95).
; PLAN: r0=450(x), r1=205(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x1), r6=0(y1), r7=406(x2), r8=34(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=95(y), r12=34(width), r13=32(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 205
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 0
LDI r7, 406
LDI r8, 34
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 95
LDI r12, 34
LDI r13, 32
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
