; DESCRIPTION: Draws a cyan line from (363, 115) to (92, 246).
; PLAN: r0=363(x1), r1=115(y1), r2=92(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 115
LDI r2, 92
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
