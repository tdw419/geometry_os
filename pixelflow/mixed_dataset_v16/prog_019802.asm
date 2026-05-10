; DESCRIPTION: Renders a cyan line between points (184, 9) and (187, 13).
; PLAN: r0=184(x1), r1=9(y1), r2=187(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 9
LDI r2, 187
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
