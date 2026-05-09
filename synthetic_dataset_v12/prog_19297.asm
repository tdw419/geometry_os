; DESCRIPTION: Renders a cyan line between points (303, 224) and (312, 95).
; PLAN: r0=303(x1), r1=224(y1), r2=312(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 224
LDI r2, 312
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
