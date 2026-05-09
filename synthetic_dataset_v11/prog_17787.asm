; DESCRIPTION: Composite: . Then Draws a cyan line from (202, 250) to (174, 198). Then Sets a single black pixel at (75, 203).
; PLAN: r0=202(x1), r1=250(y1), r2=174(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=75(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (202, 250) to (174, 198).
; PLAN: r0=202(x1), r1=250(y1), r2=174(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 250
LDI r2, 174
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (75, 203).
; PLAN: r0=75(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
HALT
