; DESCRIPTION: Places a cyan line segment connecting (472, 47) to (42, 184).
; PLAN: r0=472(x1), r1=47(y1), r2=42(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 47
LDI r2, 42
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
