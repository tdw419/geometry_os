; DESCRIPTION: Places a cyan line segment connecting (254, 117) to (169, 42).
; PLAN: r0=254(x1), r1=117(y1), r2=169(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 117
LDI r2, 169
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
