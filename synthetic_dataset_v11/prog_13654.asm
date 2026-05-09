; DESCRIPTION: Composite: . Then Draws a red line from (122, 219) to (205, 65). Then Sets a single yellow pixel at (189, 224).
; PLAN: r0=122(x1), r1=219(y1), r2=205(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=189(x), r1=224(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (122, 219) to (205, 65).
; PLAN: r0=122(x1), r1=219(y1), r2=205(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 219
LDI r2, 205
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (189, 224).
; PLAN: r0=189(x), r1=224(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 224
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
