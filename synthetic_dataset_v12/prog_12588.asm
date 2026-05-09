; DESCRIPTION: Renders a red line between points (401, 171) and (264, 58).
; PLAN: r0=401(x1), r1=171(y1), r2=264(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 171
LDI r2, 264
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
