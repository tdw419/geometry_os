; DESCRIPTION: Renders a orange line between points (481, 168) and (403, 143).
; PLAN: r0=481(x1), r1=168(y1), r2=403(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 168
LDI r2, 403
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
