; DESCRIPTION: Composite: Sets a single purple pixel at (364, 193) then Renders a orange box of size 90x27 starting at (293, 150) then Renders a orange line between points (308, 39) and (236, 94).
; PLAN: r0=364(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=150(y), r7=90(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x1), r11=39(y1), r12=236(x2), r13=94(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 150
LDI r7, 90
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 39
LDI r12, 236
LDI r13, 94
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
