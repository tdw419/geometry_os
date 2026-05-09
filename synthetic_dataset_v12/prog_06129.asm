; DESCRIPTION: Composite: Renders a yellow line between points (193, 146) and (94, 24) then Draws a cyan circle centered at (210, 90) with radius 70 then Creates a yellow rectangular region at (367, 52) spanning 107 by 42 pixels.
; PLAN: r0=193(x1), r1=146(y1), r2=94(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=90(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=52(y), r12=107(width), r13=42(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 146
LDI r2, 94
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 90
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 52
LDI r12, 107
LDI r13, 42
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
