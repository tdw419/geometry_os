; DESCRIPTION: Renders a black line between points (197, 42) and (205, 125).
; PLAN: r0=197(x1), r1=42(y1), r2=205(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 42
LDI r2, 205
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
