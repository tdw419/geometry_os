; DESCRIPTION: Draws a white line from (135, 242) to (319, 216).
; PLAN: r0=135(x1), r1=242(y1), r2=319(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 242
LDI r2, 319
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
