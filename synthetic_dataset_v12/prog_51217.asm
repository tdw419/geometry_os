; DESCRIPTION: Renders a white line between points (42, 110) and (346, 150).
; PLAN: r0=42(x1), r1=110(y1), r2=346(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 110
LDI r2, 346
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
