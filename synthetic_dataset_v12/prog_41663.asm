; DESCRIPTION: Composite: Creates a yellow rectangular region at (343, 85) spanning 32 by 29 pixels then Places a magenta line segment connecting (446, 33) to (273, 108) then Renders a cyan disk with center (111, 174) and radius 57.
; PLAN: r0=343(x), r1=85(y), r2=32(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=33(y1), r7=273(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=174(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 85
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 33
LDI r7, 273
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 174
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
