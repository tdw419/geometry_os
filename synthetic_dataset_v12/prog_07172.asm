; DESCRIPTION: Draws a green line from (301, 87) to (446, 47).
; PLAN: r0=301(x1), r1=87(y1), r2=446(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 87
LDI r2, 446
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
