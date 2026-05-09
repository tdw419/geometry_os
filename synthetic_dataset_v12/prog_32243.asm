; DESCRIPTION: Renders a cyan line between points (380, 85) and (377, 50).
; PLAN: r0=380(x1), r1=85(y1), r2=377(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 85
LDI r2, 377
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
