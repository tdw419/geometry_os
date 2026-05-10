; DESCRIPTION: Renders a cyan line segment connecting (81, 39) to (295, 138).
; PLAN: r0=81(x1), r1=39(y1), r2=295(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 39
LDI r2, 295
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
