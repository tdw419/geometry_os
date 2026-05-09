; DESCRIPTION: Renders a white line between points (252, 221) and (235, 198).
; PLAN: r0=252(x1), r1=221(y1), r2=235(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 221
LDI r2, 235
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
