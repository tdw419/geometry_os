; DESCRIPTION: Places a yellow line segment connecting (82, 124) to (405, 165).
; PLAN: r0=82(x1), r1=124(y1), r2=405(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 124
LDI r2, 405
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
