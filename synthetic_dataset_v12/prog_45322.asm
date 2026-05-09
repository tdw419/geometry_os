; DESCRIPTION: Places a red line segment connecting (487, 240) to (467, 54).
; PLAN: r0=487(x1), r1=240(y1), r2=467(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 240
LDI r2, 467
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
