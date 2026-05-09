; DESCRIPTION: Renders a cyan line between points (217, 119) and (224, 220).
; PLAN: r0=217(x1), r1=119(y1), r2=224(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 119
LDI r2, 224
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
