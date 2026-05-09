; DESCRIPTION: Renders a yellow line between points (405, 139) and (474, 239).
; PLAN: r0=405(x1), r1=139(y1), r2=474(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 139
LDI r2, 474
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
