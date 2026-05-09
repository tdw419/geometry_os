; DESCRIPTION: Draws a red line from (189, 107) to (173, 78).
; PLAN: r0=189(x1), r1=107(y1), r2=173(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 107
LDI r2, 173
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
