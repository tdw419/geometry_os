; DESCRIPTION: Places a cyan line segment connecting (59, 168) to (169, 92).
; PLAN: r0=59(x1), r1=168(y1), r2=169(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 168
LDI r2, 169
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
