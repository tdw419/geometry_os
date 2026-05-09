; DESCRIPTION: Composite: . Then Draws a red circle centered at (120, 87) with radius 78. Then Draws a orange line from (126, 128) to (222, 242).
; PLAN: r0=120(x), r1=87(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x1), r1=128(y1), r2=222(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (120, 87) with radius 78.
; PLAN: r0=120(x), r1=87(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 87
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (126, 128) to (222, 242).
; PLAN: r0=126(x1), r1=128(y1), r2=222(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 128
LDI r2, 222
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
