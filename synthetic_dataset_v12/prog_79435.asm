; DESCRIPTION: Draws a green line from (39, 9) to (322, 82).
; PLAN: r0=39(x1), r1=9(y1), r2=322(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 9
LDI r2, 322
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
