; DESCRIPTION: Renders a red line between points (164, 42) and (42, 135).
; PLAN: r0=164(x1), r1=42(y1), r2=42(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 42
LDI r2, 42
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
