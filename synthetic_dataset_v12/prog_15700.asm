; DESCRIPTION: Composite: Places a green 75x120 rectangle at position (214, 90) then Draws a green line from (239, 8) to (306, 21) then Sets a single yellow pixel at (504, 144).
; PLAN: r0=214(x), r1=90(y), r2=75(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=8(y1), r7=306(x2), r8=21(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=504(x), r11=144(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 90
LDI r2, 75
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 8
LDI r7, 306
LDI r8, 21
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 144
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
