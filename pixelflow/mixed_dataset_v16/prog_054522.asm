; DESCRIPTION: Draws a cyan line from (105, 182) to (245, 235).
; PLAN: r0=105(x1), r1=182(y1), r2=245(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 182
LDI r2, 245
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
