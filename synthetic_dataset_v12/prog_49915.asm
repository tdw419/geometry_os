; DESCRIPTION: Places a cyan line segment connecting (268, 143) to (292, 210).
; PLAN: r0=268(x1), r1=143(y1), r2=292(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 143
LDI r2, 292
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
