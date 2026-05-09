; DESCRIPTION: Draws a cyan line from (60, 147) to (124, 107).
; PLAN: r0=60(x1), r1=147(y1), r2=124(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 147
LDI r2, 124
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
