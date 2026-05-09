; DESCRIPTION: Renders a white line between points (413, 209) and (381, 142).
; PLAN: r0=413(x1), r1=209(y1), r2=381(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 209
LDI r2, 381
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
