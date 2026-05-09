; DESCRIPTION: Draws a cyan line from (503, 33) to (85, 140).
; PLAN: r0=503(x1), r1=33(y1), r2=85(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 33
LDI r2, 85
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
