; DESCRIPTION: Places a cyan line segment connecting (74, 143) to (384, 10).
; PLAN: r0=74(x1), r1=143(y1), r2=384(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 143
LDI r2, 384
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
