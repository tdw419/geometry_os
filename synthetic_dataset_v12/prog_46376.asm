; DESCRIPTION: Places a white line segment connecting (247, 231) to (215, 12).
; PLAN: r0=247(x1), r1=231(y1), r2=215(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 231
LDI r2, 215
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
