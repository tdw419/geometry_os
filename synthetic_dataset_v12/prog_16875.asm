; DESCRIPTION: Places a red line segment connecting (160, 228) to (487, 229).
; PLAN: r0=160(x1), r1=228(y1), r2=487(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 228
LDI r2, 487
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
