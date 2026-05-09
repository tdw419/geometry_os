; DESCRIPTION: Places a cyan line segment connecting (380, 106) to (365, 53).
; PLAN: r0=380(x1), r1=106(y1), r2=365(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 106
LDI r2, 365
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
