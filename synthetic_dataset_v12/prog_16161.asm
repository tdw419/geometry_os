; DESCRIPTION: Renders a cyan line between points (219, 79) and (174, 165).
; PLAN: r0=219(x1), r1=79(y1), r2=174(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 79
LDI r2, 174
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
