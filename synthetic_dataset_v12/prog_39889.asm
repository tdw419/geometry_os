; DESCRIPTION: Renders a orange line between points (346, 127) and (235, 59).
; PLAN: r0=346(x1), r1=127(y1), r2=235(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 127
LDI r2, 235
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
