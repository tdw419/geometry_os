; DESCRIPTION: Composite: Places a red line segment connecting (96, 231) to (320, 246) then Creates a orange circular shape at (391, 117) with radius 22 then Places a magenta dot at position (271, 40).
; PLAN: r0=96(x1), r1=231(y1), r2=320(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=117(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=40(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 231
LDI r2, 320
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 117
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 40
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
