; DESCRIPTION: Renders a red line between points (209, 222) and (183, 180).
; PLAN: r0=209(x1), r1=222(y1), r2=183(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 222
LDI r2, 183
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
