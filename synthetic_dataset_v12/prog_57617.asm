; DESCRIPTION: Composite: Draws a cyan circle centered at (379, 145) with radius 50 then Draws a red line from (263, 41) to (203, 64) then Renders a green box of size 71x89 starting at (75, 14).
; PLAN: r0=379(x), r1=145(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=41(y1), r7=203(x2), r8=64(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=14(y), r12=71(width), r13=89(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 145
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 41
LDI r7, 203
LDI r8, 64
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 14
LDI r12, 71
LDI r13, 89
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
