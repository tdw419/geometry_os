; DESCRIPTION: Draws a cyan line from (229, 169) to (214, 39).
; PLAN: r0=229(x1), r1=169(y1), r2=214(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 169
LDI r2, 214
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
