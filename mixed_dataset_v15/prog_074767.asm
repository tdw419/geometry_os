; DESCRIPTION: Draws a red line from (189, 131) to (187, 64).
; PLAN: r0=189(x1), r1=131(y1), r2=187(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 131
LDI r2, 187
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
