; DESCRIPTION: Draws a cyan line from (304, 76) to (498, 188).
; PLAN: r0=304(x1), r1=76(y1), r2=498(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 76
LDI r2, 498
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
