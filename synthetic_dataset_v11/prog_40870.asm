; DESCRIPTION: Renders a cyan line between points (200, 42) and (48, 70).
; PLAN: r0=200(x1), r1=42(y1), r2=48(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 42
LDI r2, 48
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
