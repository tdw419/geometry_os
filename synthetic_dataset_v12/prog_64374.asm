; DESCRIPTION: Places a green line segment connecting (487, 187) to (72, 173).
; PLAN: r0=487(x1), r1=187(y1), r2=72(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 187
LDI r2, 72
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
