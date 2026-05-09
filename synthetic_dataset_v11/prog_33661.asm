; DESCRIPTION: Draws a red line from (0, 42) to (180, 1).
; PLAN: r0=0(x1), r1=42(y1), r2=180(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 42
LDI r2, 180
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
