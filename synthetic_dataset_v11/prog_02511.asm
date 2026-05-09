; DESCRIPTION: Draws a cyan line from (112, 168) to (131, 169).
; PLAN: r0=112(x1), r1=168(y1), r2=131(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 168
LDI r2, 131
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
