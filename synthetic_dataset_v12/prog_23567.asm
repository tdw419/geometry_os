; DESCRIPTION: Places a cyan line segment connecting (215, 52) to (332, 196).
; PLAN: r0=215(x1), r1=52(y1), r2=332(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 52
LDI r2, 332
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
