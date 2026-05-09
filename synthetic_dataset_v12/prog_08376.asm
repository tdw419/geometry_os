; DESCRIPTION: Places a red line segment connecting (327, 242) to (300, 13).
; PLAN: r0=327(x1), r1=242(y1), r2=300(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 242
LDI r2, 300
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
