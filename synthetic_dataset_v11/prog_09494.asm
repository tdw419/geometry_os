; DESCRIPTION: Renders a white line between points (165, 209) and (168, 56).
; PLAN: r0=165(x1), r1=209(y1), r2=168(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 209
LDI r2, 168
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
