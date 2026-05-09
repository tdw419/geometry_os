; DESCRIPTION: Places a cyan line segment connecting (17, 134) to (352, 86).
; PLAN: r0=17(x1), r1=134(y1), r2=352(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 134
LDI r2, 352
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
