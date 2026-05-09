; DESCRIPTION: Draws a cyan line from (164, 144) to (47, 167).
; PLAN: r0=164(x1), r1=144(y1), r2=47(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 144
LDI r2, 47
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
