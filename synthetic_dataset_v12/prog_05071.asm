; DESCRIPTION: Draws a cyan line from (218, 193) to (349, 77).
; PLAN: r0=218(x1), r1=193(y1), r2=349(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 193
LDI r2, 349
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
