; DESCRIPTION: Composite: . Then Sets a single green pixel at (56, 111). Then Draws a black line from (205, 57) to (220, 241).
; PLAN: r0=56(x), r1=111(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=205(x1), r1=57(y1), r2=220(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (56, 111).
; PLAN: r0=56(x), r1=111(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 111
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (205, 57) to (220, 241).
; PLAN: r0=205(x1), r1=57(y1), r2=220(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 57
LDI r2, 220
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
