; DESCRIPTION: Renders a orange line between points (168, 152) and (16, 174).
; PLAN: r0=168(x1), r1=152(y1), r2=16(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 152
LDI r2, 16
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
