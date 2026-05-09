; DESCRIPTION: Renders a magenta line between points (299, 128) and (199, 166).
; PLAN: r0=299(x1), r1=128(y1), r2=199(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 128
LDI r2, 199
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
