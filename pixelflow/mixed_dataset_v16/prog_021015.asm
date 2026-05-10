; DESCRIPTION: Renders a cyan line between points (152, 233) and (150, 89).
; PLAN: r0=152(x1), r1=233(y1), r2=150(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 233
LDI r2, 150
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
