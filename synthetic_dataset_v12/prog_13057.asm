; DESCRIPTION: Renders a cyan line between points (209, 247) and (405, 123).
; PLAN: r0=209(x1), r1=247(y1), r2=405(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 247
LDI r2, 405
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
