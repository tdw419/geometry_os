; DESCRIPTION: Composite: Creates a blue rectangular region at (268, 27) spanning 81 by 110 pixels then Sets a single cyan pixel at (489, 218) then Draws a cyan circle centered at (470, 146) with radius 35.
; PLAN: r0=268(x), r1=27(y), r2=81(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=218(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=470(x), r11=146(y), r12=35(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 27
LDI r2, 81
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 218
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 146
LDI r12, 35
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
