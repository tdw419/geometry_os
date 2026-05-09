; DESCRIPTION: Renders a cyan line between points (180, 50) and (165, 144).
; PLAN: r0=180(x1), r1=50(y1), r2=165(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 50
LDI r2, 165
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
