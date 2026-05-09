; DESCRIPTION: Draws a white line from (265, 73) to (186, 182).
; PLAN: r0=265(x1), r1=73(y1), r2=186(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 73
LDI r2, 186
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
