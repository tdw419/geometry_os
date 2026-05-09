; DESCRIPTION: Draws a red line from (182, 210) to (61, 64).
; PLAN: r0=182(x1), r1=210(y1), r2=61(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 210
LDI r2, 61
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
