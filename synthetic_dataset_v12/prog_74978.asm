; DESCRIPTION: Draws a cyan line from (448, 176) to (224, 209).
; PLAN: r0=448(x1), r1=176(y1), r2=224(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 176
LDI r2, 224
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
