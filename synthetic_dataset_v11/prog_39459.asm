; DESCRIPTION: Composite: . Then Draws a orange rectangle at (83, 97) with width 97 and height 100. Then Draws a cyan line from (173, 237) to (1, 157).
; PLAN: r0=83(x), r1=97(y), r2=97(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=237(y1), r2=1(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange rectangle at (83, 97) with width 97 and height 100.
; PLAN: r0=83(x), r1=97(y), r2=97(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 97
LDI r2, 97
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (173, 237) to (1, 157).
; PLAN: r0=173(x1), r1=237(y1), r2=1(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 237
LDI r2, 1
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
