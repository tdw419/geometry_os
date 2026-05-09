; DESCRIPTION: Composite: Draws a white line from (73, 80) to (283, 206) then Sets a single magenta pixel at (190, 229) then Renders a orange box of size 31x39 starting at (228, 119).
; PLAN: r0=73(x1), r1=80(y1), r2=283(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=119(y), r12=31(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 80
LDI r2, 283
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 119
LDI r12, 31
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
