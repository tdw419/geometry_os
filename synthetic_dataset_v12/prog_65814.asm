; DESCRIPTION: Renders a red line between points (256, 209) and (107, 70).
; PLAN: r0=256(x1), r1=209(y1), r2=107(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 209
LDI r2, 107
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
