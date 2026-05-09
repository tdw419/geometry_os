; DESCRIPTION: Renders a red line between points (353, 34) and (207, 213).
; PLAN: r0=353(x1), r1=34(y1), r2=207(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 34
LDI r2, 207
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
