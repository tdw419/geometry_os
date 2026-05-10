; DESCRIPTION: Places a cyan line segment connecting (469, 127) to (404, 25).
; PLAN: r0=469(x1), r1=127(y1), r2=404(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 127
LDI r2, 404
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
