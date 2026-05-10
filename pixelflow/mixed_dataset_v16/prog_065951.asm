; DESCRIPTION: Renders a cyan line between points (217, 70) and (267, 15).
; PLAN: r0=217(x1), r1=70(y1), r2=267(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 70
LDI r2, 267
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
