; DESCRIPTION: Draws a white line from (97, 154) to (190, 243).
; PLAN: r0=97(x1), r1=154(y1), r2=190(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 154
LDI r2, 190
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
