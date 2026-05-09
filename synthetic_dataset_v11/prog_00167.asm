; DESCRIPTION: Composite: . Then Sets a single red pixel at (115, 55). Then Draws a red line from (234, 39) to (108, 37).
; PLAN: r0=115(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=234(x1), r1=39(y1), r2=108(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (115, 55).
; PLAN: r0=115(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (234, 39) to (108, 37).
; PLAN: r0=234(x1), r1=39(y1), r2=108(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 39
LDI r2, 108
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
