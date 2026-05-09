; DESCRIPTION: Places a cyan line segment connecting (474, 101) to (121, 213).
; PLAN: r0=474(x1), r1=101(y1), r2=121(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 101
LDI r2, 121
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
