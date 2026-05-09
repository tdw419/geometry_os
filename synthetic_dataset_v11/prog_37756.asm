; DESCRIPTION: Renders a cyan line between points (176, 224) and (249, 56).
; PLAN: r0=176(x1), r1=224(y1), r2=249(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 224
LDI r2, 249
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
