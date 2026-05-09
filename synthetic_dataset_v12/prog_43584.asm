; DESCRIPTION: Renders a red line between points (224, 42) and (344, 63).
; PLAN: r0=224(x1), r1=42(y1), r2=344(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 42
LDI r2, 344
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
