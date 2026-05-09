; DESCRIPTION: Composite: Places a blue dot at position (363, 148) then Draws a cyan line from (373, 152) to (193, 146) then Creates a cyan rectangular region at (77, 65) spanning 29 by 14 pixels.
; PLAN: r0=363(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=152(y1), r7=193(x2), r8=146(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=65(y), r12=29(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 152
LDI r7, 193
LDI r8, 146
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 65
LDI r12, 29
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
