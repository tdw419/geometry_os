; DESCRIPTION: Draws a red line from (271, 193) to (399, 42).
; PLAN: r0=271(x1), r1=193(y1), r2=399(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 193
LDI r2, 399
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
