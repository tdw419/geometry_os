; DESCRIPTION: Draws a green line from (61, 235) to (60, 143).
; PLAN: r0=61(x1), r1=235(y1), r2=60(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 235
LDI r2, 60
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
