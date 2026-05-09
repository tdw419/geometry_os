; DESCRIPTION: Renders a cyan line between points (107, 254) and (127, 99).
; PLAN: r0=107(x1), r1=254(y1), r2=127(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 254
LDI r2, 127
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
