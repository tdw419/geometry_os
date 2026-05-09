; DESCRIPTION: Renders a black line between points (189, 210) and (228, 146).
; PLAN: r0=189(x1), r1=210(y1), r2=228(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 210
LDI r2, 228
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
