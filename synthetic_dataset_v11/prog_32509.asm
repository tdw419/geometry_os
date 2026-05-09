; DESCRIPTION: Renders a white line between points (72, 33) and (25, 16).
; PLAN: r0=72(x1), r1=33(y1), r2=25(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 33
LDI r2, 25
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
