; DESCRIPTION: Renders a cyan line segment connecting (74, 28) to (367, 23).
; PLAN: r0=74(x1), r1=28(y1), r2=367(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 28
LDI r2, 367
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
