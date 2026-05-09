; DESCRIPTION: Places a cyan line segment connecting (277, 161) to (389, 42).
; PLAN: r0=277(x1), r1=161(y1), r2=389(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 161
LDI r2, 389
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
