; DESCRIPTION: Renders a cyan line between points (9, 127) and (205, 120).
; PLAN: r0=9(x1), r1=127(y1), r2=205(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 127
LDI r2, 205
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
