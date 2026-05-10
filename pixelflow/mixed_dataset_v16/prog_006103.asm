; DESCRIPTION: Composite: Places a white line segment connecting (500, 52) to (55, 108) then Places a red 52x78 rectangle at position (340, 87).
; PLAN: r0=500(x1), r1=52(y1), r2=55(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=87(y), r7=52(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 52
LDI r2, 55
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 87
LDI r7, 52
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
