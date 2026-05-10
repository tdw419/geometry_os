; DESCRIPTION: Draws a red line from (228, 180) to (367, 47).
; PLAN: r0=228(x1), r1=180(y1), r2=367(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 180
LDI r2, 367
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
