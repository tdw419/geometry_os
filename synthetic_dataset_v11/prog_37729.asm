; DESCRIPTION: Renders a cyan line between points (184, 112) and (255, 50).
; PLAN: r0=184(x1), r1=112(y1), r2=255(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 112
LDI r2, 255
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
