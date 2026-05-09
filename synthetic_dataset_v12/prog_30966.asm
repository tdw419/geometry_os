; DESCRIPTION: Renders a cyan line between points (54, 82) and (434, 134).
; PLAN: r0=54(x1), r1=82(y1), r2=434(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 82
LDI r2, 434
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
