; DESCRIPTION: Renders a red line between points (32, 107) and (21, 146).
; PLAN: r0=32(x1), r1=107(y1), r2=21(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 107
LDI r2, 21
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
