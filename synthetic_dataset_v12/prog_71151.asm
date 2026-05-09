; DESCRIPTION: Renders a white line between points (268, 232) and (215, 195).
; PLAN: r0=268(x1), r1=232(y1), r2=215(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 232
LDI r2, 215
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
