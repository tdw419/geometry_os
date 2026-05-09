; DESCRIPTION: Draws a white line from (224, 23) to (42, 79).
; PLAN: r0=224(x1), r1=23(y1), r2=42(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 23
LDI r2, 42
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
