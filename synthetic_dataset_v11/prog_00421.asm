; DESCRIPTION: Places a red line segment connecting (42, 79) to (130, 198).
; PLAN: r0=42(x1), r1=79(y1), r2=130(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 79
LDI r2, 130
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
