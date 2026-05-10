; DESCRIPTION: Composite: Places a blue dot at position (275, 95) then Creates a red rectangular region at (140, 112) spanning 79 by 112 pixels then Places a yellow line segment connecting (57, 212) to (403, 120).
; PLAN: r0=275(x), r1=95(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=112(y), r7=79(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x1), r11=212(y1), r12=403(x2), r13=120(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 95
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 112
LDI r7, 79
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 212
LDI r12, 403
LDI r13, 120
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
