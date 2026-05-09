; DESCRIPTION: Renders a magenta line between points (243, 151) and (346, 115).
; PLAN: r0=243(x1), r1=151(y1), r2=346(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 151
LDI r2, 346
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
