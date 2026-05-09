; DESCRIPTION: Places a cyan line segment connecting (403, 189) to (112, 46).
; PLAN: r0=403(x1), r1=189(y1), r2=112(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 189
LDI r2, 112
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
