; DESCRIPTION: Draws a cyan line from (117, 193) to (301, 180).
; PLAN: r0=117(x1), r1=193(y1), r2=301(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 193
LDI r2, 301
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
