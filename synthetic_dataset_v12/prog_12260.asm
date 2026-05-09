; DESCRIPTION: Renders a cyan line between points (353, 61) and (456, 134).
; PLAN: r0=353(x1), r1=61(y1), r2=456(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 61
LDI r2, 456
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
