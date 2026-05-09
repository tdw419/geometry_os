; DESCRIPTION: Draws a blue line from (224, 146) to (92, 22).
; PLAN: r0=224(x1), r1=146(y1), r2=92(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 146
LDI r2, 92
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
