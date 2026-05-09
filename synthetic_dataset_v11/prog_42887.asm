; DESCRIPTION: Composite: . Then Draws a red line from (116, 39) to (119, 133). Then Places a green dot at position (118, 234).
; PLAN: r0=116(x1), r1=39(y1), r2=119(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (116, 39) to (119, 133).
; PLAN: r0=116(x1), r1=39(y1), r2=119(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 39
LDI r2, 119
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (118, 234).
; PLAN: r0=118(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 234
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
