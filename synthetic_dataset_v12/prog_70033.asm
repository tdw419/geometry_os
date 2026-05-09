; DESCRIPTION: Composite: Places a cyan 25x19 rectangle at position (401, 60) then Draws a orange line from (270, 52) to (310, 165) then Sets a single yellow pixel at (306, 180).
; PLAN: r0=401(x), r1=60(y), r2=25(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x1), r6=52(y1), r7=310(x2), r8=165(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=180(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 60
LDI r2, 25
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 52
LDI r7, 310
LDI r8, 165
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 180
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
