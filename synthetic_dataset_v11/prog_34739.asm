; DESCRIPTION: Composite: . Then Draws a black line from (77, 191) to (80, 94). Then Renders a orange box of size 64x104 starting at (192, 65).
; PLAN: r0=77(x1), r1=191(y1), r2=80(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=65(y), r2=64(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (77, 191) to (80, 94).
; PLAN: r0=77(x1), r1=191(y1), r2=80(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 191
LDI r2, 80
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 64x104 starting at (192, 65).
; PLAN: r0=192(x), r1=65(y), r2=64(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 65
LDI r2, 64
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
