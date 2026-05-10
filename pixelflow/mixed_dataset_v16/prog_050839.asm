; DESCRIPTION: Renders a green line between points (199, 42) and (46, 57).
; PLAN: r0=199(x1), r1=42(y1), r2=46(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 42
LDI r2, 46
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
