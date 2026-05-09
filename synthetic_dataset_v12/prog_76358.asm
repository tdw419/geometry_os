; DESCRIPTION: Places a cyan line segment connecting (455, 150) to (111, 182).
; PLAN: r0=455(x1), r1=150(y1), r2=111(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 150
LDI r2, 111
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
