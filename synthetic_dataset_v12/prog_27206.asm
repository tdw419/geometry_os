; DESCRIPTION: Places a red line segment connecting (214, 44) to (487, 61).
; PLAN: r0=214(x1), r1=44(y1), r2=487(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 44
LDI r2, 487
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
