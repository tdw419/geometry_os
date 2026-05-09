; DESCRIPTION: Draws a green line from (243, 44) to (322, 126).
; PLAN: r0=243(x1), r1=44(y1), r2=322(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 44
LDI r2, 322
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
