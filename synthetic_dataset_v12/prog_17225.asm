; DESCRIPTION: Draws a cyan line from (136, 225) to (224, 135).
; PLAN: r0=136(x1), r1=225(y1), r2=224(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 225
LDI r2, 224
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
