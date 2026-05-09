; DESCRIPTION: Places a cyan line segment connecting (182, 125) to (243, 124).
; PLAN: r0=182(x1), r1=125(y1), r2=243(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 125
LDI r2, 243
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
