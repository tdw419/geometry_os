; DESCRIPTION: Places a cyan line segment connecting (54, 168) to (460, 11).
; PLAN: r0=54(x1), r1=168(y1), r2=460(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 168
LDI r2, 460
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
