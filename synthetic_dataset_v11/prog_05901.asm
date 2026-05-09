; DESCRIPTION: Draws a white line from (224, 235) to (250, 255).
; PLAN: r0=224(x1), r1=235(y1), r2=250(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 235
LDI r2, 250
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
