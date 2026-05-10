; DESCRIPTION: Draws a cyan line from (208, 137) to (66, 248).
; PLAN: r0=208(x1), r1=137(y1), r2=66(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 137
LDI r2, 66
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
