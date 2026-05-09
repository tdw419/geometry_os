; DESCRIPTION: Renders a cyan line between points (59, 111) and (469, 245).
; PLAN: r0=59(x1), r1=111(y1), r2=469(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 111
LDI r2, 469
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
