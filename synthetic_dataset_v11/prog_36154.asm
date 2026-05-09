; DESCRIPTION: Composite: . Then Draws a red line from (246, 96) to (200, 236). Then Places a cyan dot at position (238, 78).
; PLAN: r0=246(x1), r1=96(y1), r2=200(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=238(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (246, 96) to (200, 236).
; PLAN: r0=246(x1), r1=96(y1), r2=200(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 96
LDI r2, 200
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (238, 78).
; PLAN: r0=238(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
