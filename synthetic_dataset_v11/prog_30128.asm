; DESCRIPTION: Renders a cyan line between points (113, 100) and (224, 169).
; PLAN: r0=113(x1), r1=100(y1), r2=224(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 100
LDI r2, 224
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
