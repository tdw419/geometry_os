; DESCRIPTION: Draws a cyan line from (197, 182) to (77, 36).
; PLAN: r0=197(x1), r1=182(y1), r2=77(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 182
LDI r2, 77
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
