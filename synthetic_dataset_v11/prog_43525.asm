; DESCRIPTION: Draws a cyan line from (172, 133) to (193, 73).
; PLAN: r0=172(x1), r1=133(y1), r2=193(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 133
LDI r2, 193
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
