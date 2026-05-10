; DESCRIPTION: Draws a green line from (357, 242) to (482, 200).
; PLAN: r0=357(x1), r1=242(y1), r2=482(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 242
LDI r2, 482
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
