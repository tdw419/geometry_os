; DESCRIPTION: Renders a cyan line segment connecting (259, 83) to (59, 182).
; PLAN: r0=259(x1), r1=83(y1), r2=59(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 83
LDI r2, 59
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
