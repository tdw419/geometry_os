; DESCRIPTION: Renders a red line between points (96, 150) and (5, 213).
; PLAN: r0=96(x1), r1=150(y1), r2=5(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 150
LDI r2, 5
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
