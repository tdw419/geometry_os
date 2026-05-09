; DESCRIPTION: Draws a yellow line from (453, 93) to (213, 213).
; PLAN: r0=453(x1), r1=93(y1), r2=213(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 93
LDI r2, 213
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
