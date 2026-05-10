; DESCRIPTION: Renders a white line between points (42, 63) and (481, 8).
; PLAN: r0=42(x1), r1=63(y1), r2=481(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 63
LDI r2, 481
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
