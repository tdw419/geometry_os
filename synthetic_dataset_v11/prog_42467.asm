; DESCRIPTION: Renders a cyan line between points (165, 143) and (251, 251).
; PLAN: r0=165(x1), r1=143(y1), r2=251(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 143
LDI r2, 251
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
