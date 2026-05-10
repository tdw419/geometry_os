; DESCRIPTION: Places a red line segment connecting (55, 235) to (403, 213).
; PLAN: r0=55(x1), r1=235(y1), r2=403(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 235
LDI r2, 403
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
