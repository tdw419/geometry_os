; DESCRIPTION: Renders a red line between points (279, 244) and (224, 134).
; PLAN: r0=279(x1), r1=244(y1), r2=224(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 244
LDI r2, 224
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
