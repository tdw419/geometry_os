; DESCRIPTION: Places a red line segment connecting (152, 47) to (121, 214).
; PLAN: r0=152(x1), r1=47(y1), r2=121(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 47
LDI r2, 121
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
