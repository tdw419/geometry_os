; DESCRIPTION: Places a cyan line segment connecting (281, 63) to (113, 121).
; PLAN: r0=281(x1), r1=63(y1), r2=113(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 63
LDI r2, 113
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
