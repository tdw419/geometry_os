; DESCRIPTION: Draws a green line from (446, 77) to (102, 13).
; PLAN: r0=446(x1), r1=77(y1), r2=102(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 77
LDI r2, 102
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
