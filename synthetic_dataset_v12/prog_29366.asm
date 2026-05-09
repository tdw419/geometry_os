; DESCRIPTION: Renders a cyan line between points (120, 180) and (203, 38).
; PLAN: r0=120(x1), r1=180(y1), r2=203(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 180
LDI r2, 203
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
