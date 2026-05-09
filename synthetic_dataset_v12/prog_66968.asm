; DESCRIPTION: Renders a white line between points (82, 173) and (438, 19).
; PLAN: r0=82(x1), r1=173(y1), r2=438(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 173
LDI r2, 438
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
