; DESCRIPTION: Places a white line segment connecting (302, 173) to (440, 161).
; PLAN: r0=302(x1), r1=173(y1), r2=440(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 173
LDI r2, 440
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
