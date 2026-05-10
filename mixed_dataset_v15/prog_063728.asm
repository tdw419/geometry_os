; DESCRIPTION: Draws a red line from (354, 206) to (470, 95).
; PLAN: r0=354(x1), r1=206(y1), r2=470(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 206
LDI r2, 470
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
