; DESCRIPTION: Composite: Places a orange line segment connecting (314, 249) to (120, 180) then Places a green dot at position (403, 145) then Renders a cyan box of size 75x112 starting at (25, 13).
; PLAN: r0=314(x1), r1=249(y1), r2=120(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=25(x), r11=13(y), r12=75(width), r13=112(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 249
LDI r2, 120
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 25
LDI r11, 13
LDI r12, 75
LDI r13, 112
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
