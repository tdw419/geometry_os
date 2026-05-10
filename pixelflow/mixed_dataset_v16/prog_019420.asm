; DESCRIPTION: Draws a cyan line from (458, 140) to (241, 202).
; PLAN: r0=458(x1), r1=140(y1), r2=241(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 140
LDI r2, 241
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
