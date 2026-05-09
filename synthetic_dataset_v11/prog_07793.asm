; DESCRIPTION: Renders a cyan line between points (95, 132) and (53, 134).
; PLAN: r0=95(x1), r1=132(y1), r2=53(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 132
LDI r2, 53
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
