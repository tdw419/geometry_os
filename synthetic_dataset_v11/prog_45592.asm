; DESCRIPTION: Renders a cyan line between points (219, 212) and (74, 42).
; PLAN: r0=219(x1), r1=212(y1), r2=74(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 212
LDI r2, 74
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
