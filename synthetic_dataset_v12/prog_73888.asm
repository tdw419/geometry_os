; DESCRIPTION: Draws a cyan line from (381, 107) to (14, 214).
; PLAN: r0=381(x1), r1=107(y1), r2=14(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 107
LDI r2, 14
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
