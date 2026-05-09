; DESCRIPTION: Renders a white line between points (96, 82) and (64, 125).
; PLAN: r0=96(x1), r1=82(y1), r2=64(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 82
LDI r2, 64
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
