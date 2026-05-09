; DESCRIPTION: Renders a red line between points (382, 152) and (333, 183).
; PLAN: r0=382(x1), r1=152(y1), r2=333(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 152
LDI r2, 333
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
