; DESCRIPTION: Draws a cyan line from (322, 81) to (372, 35).
; PLAN: r0=322(x1), r1=81(y1), r2=372(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 81
LDI r2, 372
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
