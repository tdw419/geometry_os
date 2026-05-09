; DESCRIPTION: Renders a white line between points (218, 42) and (191, 60).
; PLAN: r0=218(x1), r1=42(y1), r2=191(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 42
LDI r2, 191
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
