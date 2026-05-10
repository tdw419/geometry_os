; DESCRIPTION: Draws a cyan line from (253, 8) to (241, 170).
; PLAN: r0=253(x1), r1=8(y1), r2=241(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 8
LDI r2, 241
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
