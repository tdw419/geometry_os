; DESCRIPTION: Renders a red line between points (327, 178) and (382, 209).
; PLAN: r0=327(x1), r1=178(y1), r2=382(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 178
LDI r2, 382
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
