; DESCRIPTION: Renders a green line between points (410, 95) and (184, 178).
; PLAN: r0=410(x1), r1=95(y1), r2=184(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 95
LDI r2, 184
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
