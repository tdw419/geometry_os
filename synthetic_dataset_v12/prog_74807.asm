; DESCRIPTION: Renders a cyan line between points (360, 53) and (475, 5).
; PLAN: r0=360(x1), r1=53(y1), r2=475(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 53
LDI r2, 475
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
