; DESCRIPTION: Draws a cyan line from (61, 167) to (225, 127).
; PLAN: r0=61(x1), r1=167(y1), r2=225(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 167
LDI r2, 225
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
