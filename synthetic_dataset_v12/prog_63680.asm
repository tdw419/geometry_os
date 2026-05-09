; DESCRIPTION: Renders a magenta line between points (209, 244) and (415, 143).
; PLAN: r0=209(x1), r1=244(y1), r2=415(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 244
LDI r2, 415
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
