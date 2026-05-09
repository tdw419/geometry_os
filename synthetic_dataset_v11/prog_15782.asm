; DESCRIPTION: Draws a cyan line from (145, 149) to (171, 141).
; PLAN: r0=145(x1), r1=149(y1), r2=171(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 149
LDI r2, 171
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
