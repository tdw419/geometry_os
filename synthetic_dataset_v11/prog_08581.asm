; DESCRIPTION: Draws a white line from (106, 242) to (247, 13).
; PLAN: r0=106(x1), r1=242(y1), r2=247(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 242
LDI r2, 247
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
