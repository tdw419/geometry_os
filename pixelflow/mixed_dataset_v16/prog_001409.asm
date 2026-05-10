; DESCRIPTION: Places a cyan line segment connecting (304, 73) to (143, 182).
; PLAN: r0=304(x1), r1=73(y1), r2=143(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 73
LDI r2, 143
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
