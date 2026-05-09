; DESCRIPTION: Draws a cyan line from (206, 107) to (475, 185).
; PLAN: r0=206(x1), r1=107(y1), r2=475(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 107
LDI r2, 475
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
