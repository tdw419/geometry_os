; DESCRIPTION: Renders a cyan line between points (42, 110) and (143, 206).
; PLAN: r0=42(x1), r1=110(y1), r2=143(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 110
LDI r2, 143
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
