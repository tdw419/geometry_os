; DESCRIPTION: Places a cyan line segment connecting (48, 238) to (51, 36).
; PLAN: r0=48(x1), r1=238(y1), r2=51(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 238
LDI r2, 51
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
