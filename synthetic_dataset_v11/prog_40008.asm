; DESCRIPTION: Draws a cyan line from (61, 171) to (110, 35).
; PLAN: r0=61(x1), r1=171(y1), r2=110(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 171
LDI r2, 110
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
