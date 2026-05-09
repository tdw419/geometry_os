; DESCRIPTION: Draws a black line from (502, 90) to (405, 190).
; PLAN: r0=502(x1), r1=90(y1), r2=405(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 90
LDI r2, 405
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
