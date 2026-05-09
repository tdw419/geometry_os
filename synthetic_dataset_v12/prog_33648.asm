; DESCRIPTION: Composite: Renders a yellow disk with center (143, 228) and radius 12 then Draws a blue line from (17, 210) to (398, 215) then Renders a orange box of size 119x90 starting at (5, 156).
; PLAN: r0=143(x), r1=228(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=210(y1), r7=398(x2), r8=215(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=156(y), r12=119(width), r13=90(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 228
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 210
LDI r7, 398
LDI r8, 215
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 156
LDI r12, 119
LDI r13, 90
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
