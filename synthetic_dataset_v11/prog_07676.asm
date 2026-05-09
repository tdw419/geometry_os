; DESCRIPTION: Draws a red line from (226, 221) to (187, 60).
; PLAN: r0=226(x1), r1=221(y1), r2=187(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 221
LDI r2, 187
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
