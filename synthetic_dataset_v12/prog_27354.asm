; DESCRIPTION: Composite: Places a black line segment connecting (409, 150) to (177, 90) then Renders a orange box of size 75x34 starting at (392, 135) then Draws a cyan circle centered at (437, 52) with radius 23.
; PLAN: r0=409(x1), r1=150(y1), r2=177(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=135(y), r7=75(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=437(x), r11=52(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 150
LDI r2, 177
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 135
LDI r7, 75
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 52
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
