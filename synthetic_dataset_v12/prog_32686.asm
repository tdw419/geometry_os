; DESCRIPTION: Draws a cyan line from (272, 12) to (503, 247).
; PLAN: r0=272(x1), r1=12(y1), r2=503(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 12
LDI r2, 503
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
