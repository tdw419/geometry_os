; DESCRIPTION: Composite: Renders a green disk with center (385, 180) and radius 75 then Creates a cyan rectangular region at (387, 132) spanning 49 by 78 pixels then Draws a blue line from (175, 177) to (365, 192).
; PLAN: r0=385(x), r1=180(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=132(y), r7=49(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x1), r11=177(y1), r12=365(x2), r13=192(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 180
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 132
LDI r7, 49
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 177
LDI r12, 365
LDI r13, 192
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
