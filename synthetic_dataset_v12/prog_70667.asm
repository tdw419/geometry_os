; DESCRIPTION: Renders a cyan line between points (337, 125) and (164, 143).
; PLAN: r0=337(x1), r1=125(y1), r2=164(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 125
LDI r2, 164
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
