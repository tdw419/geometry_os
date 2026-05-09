; DESCRIPTION: Places a green line segment connecting (487, 71) to (376, 246).
; PLAN: r0=487(x1), r1=71(y1), r2=376(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 71
LDI r2, 376
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
