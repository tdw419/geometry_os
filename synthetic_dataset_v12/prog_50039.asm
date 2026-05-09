; DESCRIPTION: Draws a cyan line from (322, 234) to (494, 4).
; PLAN: r0=322(x1), r1=234(y1), r2=494(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 234
LDI r2, 494
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
