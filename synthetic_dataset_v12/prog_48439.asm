; DESCRIPTION: Renders a green line between points (228, 53) and (105, 161).
; PLAN: r0=228(x1), r1=53(y1), r2=105(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 53
LDI r2, 105
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
