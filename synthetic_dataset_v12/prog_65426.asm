; DESCRIPTION: Draws a yellow line from (300, 235) to (353, 16).
; PLAN: r0=300(x1), r1=235(y1), r2=353(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 235
LDI r2, 353
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
