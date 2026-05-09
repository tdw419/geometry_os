; DESCRIPTION: Renders a yellow line between points (384, 42) and (181, 82).
; PLAN: r0=384(x1), r1=42(y1), r2=181(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 42
LDI r2, 181
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
