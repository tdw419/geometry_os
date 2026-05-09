; DESCRIPTION: Composite: . Then Places a black dot at position (122, 218). Then Draws a white line from (182, 101) to (246, 70).
; PLAN: r0=122(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=182(x1), r1=101(y1), r2=246(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (122, 218).
; PLAN: r0=122(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (182, 101) to (246, 70).
; PLAN: r0=182(x1), r1=101(y1), r2=246(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 101
LDI r2, 246
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
