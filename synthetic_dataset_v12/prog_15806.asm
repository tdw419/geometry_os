; DESCRIPTION: Draws a red line from (322, 210) to (78, 195).
; PLAN: r0=322(x1), r1=210(y1), r2=78(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 210
LDI r2, 78
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
