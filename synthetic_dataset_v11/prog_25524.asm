; DESCRIPTION: Draws a red line from (224, 84) to (243, 152).
; PLAN: r0=224(x1), r1=84(y1), r2=243(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 84
LDI r2, 243
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
