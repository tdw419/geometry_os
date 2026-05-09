; DESCRIPTION: Places a cyan line segment connecting (102, 95) to (135, 168).
; PLAN: r0=102(x1), r1=95(y1), r2=135(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 95
LDI r2, 135
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
