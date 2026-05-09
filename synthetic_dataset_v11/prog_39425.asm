; DESCRIPTION: Draws a white line from (242, 124) to (169, 190).
; PLAN: r0=242(x1), r1=124(y1), r2=169(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 124
LDI r2, 169
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
