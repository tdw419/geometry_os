; DESCRIPTION: Renders a cyan line between points (161, 22) and (65, 42).
; PLAN: r0=161(x1), r1=22(y1), r2=65(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 22
LDI r2, 65
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
