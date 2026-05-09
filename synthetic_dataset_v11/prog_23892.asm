; DESCRIPTION: Places a cyan line segment connecting (82, 6) to (30, 7).
; PLAN: r0=82(x1), r1=6(y1), r2=30(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 6
LDI r2, 30
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
