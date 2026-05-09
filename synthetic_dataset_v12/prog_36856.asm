; DESCRIPTION: Renders a red line between points (277, 16) and (152, 171).
; PLAN: r0=277(x1), r1=16(y1), r2=152(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 16
LDI r2, 152
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
