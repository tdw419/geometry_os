; DESCRIPTION: Places a cyan line segment connecting (167, 108) to (169, 48).
; PLAN: r0=167(x1), r1=108(y1), r2=169(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 108
LDI r2, 169
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
