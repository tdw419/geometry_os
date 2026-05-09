; DESCRIPTION: Places a cyan line segment connecting (195, 138) to (214, 29).
; PLAN: r0=195(x1), r1=138(y1), r2=214(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 138
LDI r2, 214
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
