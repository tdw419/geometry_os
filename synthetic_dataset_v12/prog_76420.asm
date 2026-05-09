; DESCRIPTION: Renders a orange line between points (214, 182) and (113, 174).
; PLAN: r0=214(x1), r1=182(y1), r2=113(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 182
LDI r2, 113
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
