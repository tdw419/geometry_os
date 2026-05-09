; DESCRIPTION: Renders a white line between points (231, 147) and (183, 113).
; PLAN: r0=231(x1), r1=147(y1), r2=183(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 147
LDI r2, 183
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
