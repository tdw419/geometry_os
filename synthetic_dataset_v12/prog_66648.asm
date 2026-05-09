; DESCRIPTION: Places a cyan line segment connecting (209, 111) to (182, 15).
; PLAN: r0=209(x1), r1=111(y1), r2=182(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 111
LDI r2, 182
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
