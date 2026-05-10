; DESCRIPTION: Renders a white line between points (140, 93) and (166, 125).
; PLAN: r0=140(x1), r1=93(y1), r2=166(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 93
LDI r2, 166
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
