; DESCRIPTION: Composite: . Then Draws a purple line from (21, 12) to (207, 187). Then Places a white dot at position (222, 83).
; PLAN: r0=21(x1), r1=12(y1), r2=207(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=222(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (21, 12) to (207, 187).
; PLAN: r0=21(x1), r1=12(y1), r2=207(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 12
LDI r2, 207
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (222, 83).
; PLAN: r0=222(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
