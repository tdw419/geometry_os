; DESCRIPTION: Draws a cyan line from (190, 219) to (276, 240).
; PLAN: r0=190(x1), r1=219(y1), r2=276(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 219
LDI r2, 276
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
