; DESCRIPTION: Places a red line segment connecting (42, 107) to (270, 255).
; PLAN: r0=42(x1), r1=107(y1), r2=270(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 107
LDI r2, 270
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
