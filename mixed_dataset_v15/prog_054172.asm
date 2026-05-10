; DESCRIPTION: Renders a cyan line between points (438, 125) and (316, 103).
; PLAN: r0=438(x1), r1=125(y1), r2=316(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 125
LDI r2, 316
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
