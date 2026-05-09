; DESCRIPTION: Places a green line segment connecting (234, 161) to (228, 192).
; PLAN: r0=234(x1), r1=161(y1), r2=228(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 161
LDI r2, 228
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
