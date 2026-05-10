; DESCRIPTION: Renders a cyan line between points (63, 82) and (470, 36).
; PLAN: r0=63(x1), r1=82(y1), r2=470(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 82
LDI r2, 470
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
