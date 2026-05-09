; DESCRIPTION: Renders a red line between points (344, 150) and (340, 151).
; PLAN: r0=344(x1), r1=150(y1), r2=340(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 150
LDI r2, 340
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
