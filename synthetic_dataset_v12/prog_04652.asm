; DESCRIPTION: Composite: Draws a blue rectangle at (64, 100) with width 112 and height 120 then Draws a green line from (433, 35) to (253, 61) then Sets a single yellow pixel at (180, 78).
; PLAN: r0=64(x), r1=100(y), r2=112(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=35(y1), r7=253(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=78(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 100
LDI r2, 112
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 35
LDI r7, 253
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 78
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
