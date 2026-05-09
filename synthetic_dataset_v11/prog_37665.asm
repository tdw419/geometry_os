; DESCRIPTION: Renders a red line between points (42, 252) and (197, 135).
; PLAN: r0=42(x1), r1=252(y1), r2=197(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 252
LDI r2, 197
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
