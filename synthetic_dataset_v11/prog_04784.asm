; DESCRIPTION: Renders a yellow line between points (48, 95) and (235, 173).
; PLAN: r0=48(x1), r1=95(y1), r2=235(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 95
LDI r2, 235
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
