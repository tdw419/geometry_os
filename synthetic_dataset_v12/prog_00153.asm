; DESCRIPTION: Draws a red line from (470, 228) to (373, 72).
; PLAN: r0=470(x1), r1=228(y1), r2=373(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 228
LDI r2, 373
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
