; DESCRIPTION: Draws a red line from (214, 50) to (120, 196).
; PLAN: r0=214(x1), r1=50(y1), r2=120(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 50
LDI r2, 120
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
