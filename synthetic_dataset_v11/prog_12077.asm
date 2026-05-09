; DESCRIPTION: Renders a cyan line between points (125, 93) and (195, 222).
; PLAN: r0=125(x1), r1=93(y1), r2=195(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 93
LDI r2, 195
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
