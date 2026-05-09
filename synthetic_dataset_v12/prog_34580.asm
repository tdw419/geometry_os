; DESCRIPTION: Places a cyan line segment connecting (210, 40) to (503, 115).
; PLAN: r0=210(x1), r1=40(y1), r2=503(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 40
LDI r2, 503
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
