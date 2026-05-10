; DESCRIPTION: Draws a cyan line from (450, 237) to (427, 180).
; PLAN: r0=450(x1), r1=237(y1), r2=427(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 237
LDI r2, 427
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
