; DESCRIPTION: Places a cyan line segment connecting (111, 177) to (117, 128).
; PLAN: r0=111(x1), r1=177(y1), r2=117(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 177
LDI r2, 117
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
