; DESCRIPTION: Draws a cyan line from (43, 144) to (391, 183).
; PLAN: r0=43(x1), r1=144(y1), r2=391(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 144
LDI r2, 391
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
