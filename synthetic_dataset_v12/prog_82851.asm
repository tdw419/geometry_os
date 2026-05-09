; DESCRIPTION: Renders a cyan line between points (360, 103) and (157, 95).
; PLAN: r0=360(x1), r1=103(y1), r2=157(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 103
LDI r2, 157
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
