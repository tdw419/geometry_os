; DESCRIPTION: Renders a cyan line between points (247, 49) and (224, 245).
; PLAN: r0=247(x1), r1=49(y1), r2=224(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 49
LDI r2, 224
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
