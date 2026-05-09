; DESCRIPTION: Composite: Renders a black line between points (39, 44) and (65, 205) then Creates a yellow rectangular region at (178, 184) spanning 60 by 69 pixels.
; PLAN: r0=39(x1), r1=44(y1), r2=65(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=184(y), r7=60(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 44
LDI r2, 65
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 184
LDI r7, 60
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
