; DESCRIPTION: Places a cyan line segment connecting (35, 209) to (24, 19).
; PLAN: r0=35(x1), r1=209(y1), r2=24(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 209
LDI r2, 24
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
