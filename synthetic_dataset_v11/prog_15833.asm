; DESCRIPTION: Places a cyan line segment connecting (234, 151) to (68, 225).
; PLAN: r0=234(x1), r1=151(y1), r2=68(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 151
LDI r2, 68
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
