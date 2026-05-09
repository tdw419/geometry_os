; DESCRIPTION: Draws a cyan line from (177, 240) to (157, 91).
; PLAN: r0=177(x1), r1=240(y1), r2=157(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 240
LDI r2, 157
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
