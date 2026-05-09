; DESCRIPTION: Renders a orange line between points (180, 131) and (224, 174).
; PLAN: r0=180(x1), r1=131(y1), r2=224(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 131
LDI r2, 224
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
