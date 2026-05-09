; DESCRIPTION: Renders a red line between points (183, 135) and (220, 236).
; PLAN: r0=183(x1), r1=135(y1), r2=220(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 135
LDI r2, 220
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
