; DESCRIPTION: Draws a cyan line from (75, 58) to (78, 235).
; PLAN: r0=75(x1), r1=58(y1), r2=78(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 58
LDI r2, 78
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
