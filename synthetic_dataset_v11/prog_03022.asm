; DESCRIPTION: Composite: . Then Places a red line segment connecting (69, 202) to (81, 205). Then Places a orange dot at position (60, 241).
; PLAN: r0=69(x1), r1=202(y1), r2=81(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (69, 202) to (81, 205).
; PLAN: r0=69(x1), r1=202(y1), r2=81(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 202
LDI r2, 81
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (60, 241).
; PLAN: r0=60(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 241
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
