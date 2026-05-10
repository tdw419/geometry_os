; DESCRIPTION: Draws a cyan line from (349, 10) to (151, 247).
; PLAN: r0=349(x1), r1=10(y1), r2=151(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 10
LDI r2, 151
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
