; DESCRIPTION: Places a cyan line segment connecting (405, 32) to (322, 246).
; PLAN: r0=405(x1), r1=32(y1), r2=322(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 32
LDI r2, 322
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
