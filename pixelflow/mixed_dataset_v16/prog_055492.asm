; DESCRIPTION: Draws a cyan line from (336, 178) to (87, 135).
; PLAN: r0=336(x1), r1=178(y1), r2=87(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 178
LDI r2, 87
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
