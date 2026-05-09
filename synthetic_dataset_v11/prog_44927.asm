; DESCRIPTION: Draws a cyan line from (59, 248) to (200, 85).
; PLAN: r0=59(x1), r1=248(y1), r2=200(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 248
LDI r2, 200
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
