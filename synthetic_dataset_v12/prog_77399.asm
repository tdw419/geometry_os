; DESCRIPTION: Renders a cyan line between points (219, 1) and (425, 75).
; PLAN: r0=219(x1), r1=1(y1), r2=425(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 1
LDI r2, 425
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
