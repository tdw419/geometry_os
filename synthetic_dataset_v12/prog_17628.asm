; DESCRIPTION: Renders a cyan line between points (184, 8) and (39, 135).
; PLAN: r0=184(x1), r1=8(y1), r2=39(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 39
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
