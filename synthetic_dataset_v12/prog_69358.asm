; DESCRIPTION: Renders a red line between points (479, 163) and (217, 171).
; PLAN: r0=479(x1), r1=163(y1), r2=217(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 163
LDI r2, 217
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
