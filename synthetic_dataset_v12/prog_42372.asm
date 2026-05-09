; DESCRIPTION: Draws a red line from (434, 12) to (502, 20).
; PLAN: r0=434(x1), r1=12(y1), r2=502(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 12
LDI r2, 502
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
