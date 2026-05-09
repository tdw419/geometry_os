; DESCRIPTION: Renders a cyan line between points (182, 87) and (49, 60).
; PLAN: r0=182(x1), r1=87(y1), r2=49(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 87
LDI r2, 49
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
