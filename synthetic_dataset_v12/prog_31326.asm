; DESCRIPTION: Renders a cyan line between points (150, 63) and (162, 138).
; PLAN: r0=150(x1), r1=63(y1), r2=162(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 63
LDI r2, 162
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
