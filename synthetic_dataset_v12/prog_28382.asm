; DESCRIPTION: Places a cyan line segment connecting (71, 10) to (291, 172).
; PLAN: r0=71(x1), r1=10(y1), r2=291(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 10
LDI r2, 291
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
