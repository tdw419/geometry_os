; DESCRIPTION: Renders a cyan line between points (11, 125) and (210, 108).
; PLAN: r0=11(x1), r1=125(y1), r2=210(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 125
LDI r2, 210
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
