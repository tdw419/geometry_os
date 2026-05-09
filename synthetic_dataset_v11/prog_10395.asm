; DESCRIPTION: Renders a cyan line between points (175, 71) and (224, 6).
; PLAN: r0=175(x1), r1=71(y1), r2=224(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 71
LDI r2, 224
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
