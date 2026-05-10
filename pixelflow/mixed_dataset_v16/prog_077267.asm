; DESCRIPTION: Places a cyan line segment connecting (58, 199) to (435, 55).
; PLAN: r0=58(x1), r1=199(y1), r2=435(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 199
LDI r2, 435
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
