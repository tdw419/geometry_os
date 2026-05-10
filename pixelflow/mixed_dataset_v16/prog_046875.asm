; DESCRIPTION: Draws a cyan line from (280, 155) to (322, 243).
; PLAN: r0=280(x1), r1=155(y1), r2=322(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 155
LDI r2, 322
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
