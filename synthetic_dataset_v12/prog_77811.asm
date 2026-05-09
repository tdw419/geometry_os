; DESCRIPTION: Places a cyan line segment connecting (420, 82) to (327, 161).
; PLAN: r0=420(x1), r1=82(y1), r2=327(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 82
LDI r2, 327
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
