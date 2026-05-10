; DESCRIPTION: Places a red line segment connecting (294, 222) to (242, 181).
; PLAN: r0=294(x1), r1=222(y1), r2=242(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 222
LDI r2, 242
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
