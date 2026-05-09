; DESCRIPTION: Renders a cyan line between points (198, 188) and (450, 81).
; PLAN: r0=198(x1), r1=188(y1), r2=450(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 188
LDI r2, 450
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
