; DESCRIPTION: Draws a cyan line from (249, 132) to (186, 134).
; PLAN: r0=249(x1), r1=132(y1), r2=186(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 132
LDI r2, 186
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
