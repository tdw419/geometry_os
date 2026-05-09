; DESCRIPTION: Renders a cyan line between points (367, 151) and (49, 43).
; PLAN: r0=367(x1), r1=151(y1), r2=49(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 151
LDI r2, 49
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
