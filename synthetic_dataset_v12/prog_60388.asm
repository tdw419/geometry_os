; DESCRIPTION: Places a cyan line segment connecting (300, 46) to (506, 249).
; PLAN: r0=300(x1), r1=46(y1), r2=506(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 46
LDI r2, 506
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
