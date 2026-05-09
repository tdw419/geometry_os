; DESCRIPTION: Draws a cyan line from (332, 253) to (427, 213).
; PLAN: r0=332(x1), r1=253(y1), r2=427(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 253
LDI r2, 427
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
