; DESCRIPTION: Places a cyan line segment connecting (53, 48) to (120, 5).
; PLAN: r0=53(x1), r1=48(y1), r2=120(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 48
LDI r2, 120
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
