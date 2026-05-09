; DESCRIPTION: Composite: Creates a orange rectangular region at (263, 234) spanning 19 by 12 pixels then Draws a white line from (401, 155) to (439, 138).
; PLAN: r0=263(x), r1=234(y), r2=19(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=155(y1), r7=439(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 234
LDI r2, 19
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 155
LDI r7, 439
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
