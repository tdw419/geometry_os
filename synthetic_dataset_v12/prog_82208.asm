; DESCRIPTION: Places a green line segment connecting (45, 247) to (171, 103).
; PLAN: r0=45(x1), r1=247(y1), r2=171(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 247
LDI r2, 171
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
