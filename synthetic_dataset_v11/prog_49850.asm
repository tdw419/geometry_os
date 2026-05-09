; DESCRIPTION: Draws a red line from (87, 129) to (69, 32).
; PLAN: r0=87(x1), r1=129(y1), r2=69(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 129
LDI r2, 69
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
