; DESCRIPTION: Draws a cyan line from (0, 190) to (235, 40).
; PLAN: r0=0(x1), r1=190(y1), r2=235(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 190
LDI r2, 235
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
