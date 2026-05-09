; DESCRIPTION: Places a cyan line segment connecting (169, 224) to (278, 46).
; PLAN: r0=169(x1), r1=224(y1), r2=278(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 224
LDI r2, 278
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
