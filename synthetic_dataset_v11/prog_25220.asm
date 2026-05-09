; DESCRIPTION: Places a cyan line segment connecting (33, 205) to (116, 76).
; PLAN: r0=33(x1), r1=205(y1), r2=116(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 205
LDI r2, 116
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
