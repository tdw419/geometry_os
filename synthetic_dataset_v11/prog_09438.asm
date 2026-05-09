; DESCRIPTION: Draws a cyan line from (232, 128) to (79, 167).
; PLAN: r0=232(x1), r1=128(y1), r2=79(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 128
LDI r2, 79
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
