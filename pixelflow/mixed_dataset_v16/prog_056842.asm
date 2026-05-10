; DESCRIPTION: Renders a cyan line between points (98, 135) and (82, 25).
; PLAN: r0=98(x1), r1=135(y1), r2=82(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 135
LDI r2, 82
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
