; DESCRIPTION: Places a white line segment connecting (434, 130) to (403, 51).
; PLAN: r0=434(x1), r1=130(y1), r2=403(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 130
LDI r2, 403
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
