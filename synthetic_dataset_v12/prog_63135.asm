; DESCRIPTION: Renders a cyan line between points (403, 251) and (235, 53).
; PLAN: r0=403(x1), r1=251(y1), r2=235(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 251
LDI r2, 235
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
