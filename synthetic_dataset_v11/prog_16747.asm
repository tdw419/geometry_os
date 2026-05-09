; DESCRIPTION: Composite: . Then Draws a red rectangle at (83, 205) with width 58 and height 26. Then Places a black line segment connecting (117, 127) to (110, 27).
; PLAN: r0=83(x), r1=205(y), r2=58(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=117(x1), r1=127(y1), r2=110(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (83, 205) with width 58 and height 26.
; PLAN: r0=83(x), r1=205(y), r2=58(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 205
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (117, 127) to (110, 27).
; PLAN: r0=117(x1), r1=127(y1), r2=110(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 127
LDI r2, 110
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
