; DESCRIPTION: Renders a cyan line between points (103, 125) and (151, 146).
; PLAN: r0=103(x1), r1=125(y1), r2=151(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 125
LDI r2, 151
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
