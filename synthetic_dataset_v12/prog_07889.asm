; DESCRIPTION: Renders a red line between points (281, 221) and (20, 224).
; PLAN: r0=281(x1), r1=221(y1), r2=20(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 221
LDI r2, 20
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
