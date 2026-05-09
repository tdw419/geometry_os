; DESCRIPTION: Renders a white line between points (242, 42) and (450, 232).
; PLAN: r0=242(x1), r1=42(y1), r2=450(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 42
LDI r2, 450
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
