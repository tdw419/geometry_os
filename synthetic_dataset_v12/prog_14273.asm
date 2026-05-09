; DESCRIPTION: Renders a green line between points (277, 179) and (384, 246).
; PLAN: r0=277(x1), r1=179(y1), r2=384(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 179
LDI r2, 384
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
