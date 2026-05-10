; DESCRIPTION: Draws a cyan line from (363, 255) to (493, 75).
; PLAN: r0=363(x1), r1=255(y1), r2=493(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 255
LDI r2, 493
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
