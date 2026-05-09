; DESCRIPTION: Renders a white line between points (260, 172) and (480, 135).
; PLAN: r0=260(x1), r1=172(y1), r2=480(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 172
LDI r2, 480
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
