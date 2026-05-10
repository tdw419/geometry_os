; DESCRIPTION: Places a cyan line segment connecting (131, 77) to (215, 27).
; PLAN: r0=131(x1), r1=77(y1), r2=215(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 77
LDI r2, 215
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
