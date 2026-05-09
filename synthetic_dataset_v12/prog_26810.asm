; DESCRIPTION: Renders a white line between points (322, 125) and (479, 172).
; PLAN: r0=322(x1), r1=125(y1), r2=479(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 125
LDI r2, 479
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
