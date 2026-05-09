; DESCRIPTION: Renders a cyan line between points (303, 134) and (265, 98).
; PLAN: r0=303(x1), r1=134(y1), r2=265(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 134
LDI r2, 265
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
