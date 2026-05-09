; DESCRIPTION: Renders a green line between points (201, 111) and (224, 42).
; PLAN: r0=201(x1), r1=111(y1), r2=224(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 111
LDI r2, 224
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
