; DESCRIPTION: Draws a cyan line from (77, 237) to (71, 233).
; PLAN: r0=77(x1), r1=237(y1), r2=71(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 237
LDI r2, 71
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
