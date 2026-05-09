; DESCRIPTION: Renders a white line between points (168, 5) and (52, 16).
; PLAN: r0=168(x1), r1=5(y1), r2=52(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 5
LDI r2, 52
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
