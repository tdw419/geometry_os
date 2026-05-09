; DESCRIPTION: Places a green line segment connecting (401, 154) to (285, 139).
; PLAN: r0=401(x1), r1=154(y1), r2=285(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 154
LDI r2, 285
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
