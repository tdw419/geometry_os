; DESCRIPTION: Composite: . Then Draws a red line from (220, 230) to (132, 157). Then Sets a single cyan pixel at (252, 188).
; PLAN: r0=220(x1), r1=230(y1), r2=132(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=252(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (220, 230) to (132, 157).
; PLAN: r0=220(x1), r1=230(y1), r2=132(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 230
LDI r2, 132
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (252, 188).
; PLAN: r0=252(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
