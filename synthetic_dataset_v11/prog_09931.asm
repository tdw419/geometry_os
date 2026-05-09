; DESCRIPTION: Places a cyan line segment connecting (82, 180) to (238, 28).
; PLAN: r0=82(x1), r1=180(y1), r2=238(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 180
LDI r2, 238
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
