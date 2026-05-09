; DESCRIPTION: Places a red line segment connecting (284, 97) to (322, 7).
; PLAN: r0=284(x1), r1=97(y1), r2=322(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 97
LDI r2, 322
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
