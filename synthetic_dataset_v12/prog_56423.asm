; DESCRIPTION: Renders a red line between points (123, 107) and (344, 197).
; PLAN: r0=123(x1), r1=107(y1), r2=344(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 107
LDI r2, 344
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
