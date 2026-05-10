; DESCRIPTION: Draws a cyan line from (323, 75) to (171, 120).
; PLAN: r0=323(x1), r1=75(y1), r2=171(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 75
LDI r2, 171
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
