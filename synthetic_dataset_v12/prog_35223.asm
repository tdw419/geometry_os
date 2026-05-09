; DESCRIPTION: Renders a red line between points (436, 13) and (365, 42).
; PLAN: r0=436(x1), r1=13(y1), r2=365(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 13
LDI r2, 365
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
