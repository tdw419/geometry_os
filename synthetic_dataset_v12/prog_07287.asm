; DESCRIPTION: Draws a cyan line from (166, 200) to (218, 169).
; PLAN: r0=166(x1), r1=200(y1), r2=218(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 200
LDI r2, 218
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
