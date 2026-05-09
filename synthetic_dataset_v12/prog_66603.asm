; DESCRIPTION: Places a red line segment connecting (401, 32) to (462, 210).
; PLAN: r0=401(x1), r1=32(y1), r2=462(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 32
LDI r2, 462
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
