; DESCRIPTION: Renders a red line between points (178, 21) and (115, 213).
; PLAN: r0=178(x1), r1=21(y1), r2=115(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 21
LDI r2, 115
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
