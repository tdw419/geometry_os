; DESCRIPTION: Draws a green line from (20, 203) to (16, 242).
; PLAN: r0=20(x1), r1=203(y1), r2=16(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 203
LDI r2, 16
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
