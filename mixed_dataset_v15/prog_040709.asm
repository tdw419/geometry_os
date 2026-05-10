; DESCRIPTION: Renders a red line between points (354, 64) and (152, 196).
; PLAN: r0=354(x1), r1=64(y1), r2=152(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 64
LDI r2, 152
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
