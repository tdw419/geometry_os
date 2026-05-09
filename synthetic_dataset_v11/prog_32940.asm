; DESCRIPTION: Draws a red line from (57, 200) to (173, 91).
; PLAN: r0=57(x1), r1=200(y1), r2=173(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 200
LDI r2, 173
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
