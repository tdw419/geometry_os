; DESCRIPTION: Places a cyan line segment connecting (209, 243) to (54, 73).
; PLAN: r0=209(x1), r1=243(y1), r2=54(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 243
LDI r2, 54
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
