; DESCRIPTION: Renders a red line between points (281, 242) and (231, 241).
; PLAN: r0=281(x1), r1=242(y1), r2=231(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 242
LDI r2, 231
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
