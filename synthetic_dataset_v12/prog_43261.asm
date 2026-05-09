; DESCRIPTION: Places a cyan line segment connecting (275, 98) to (196, 212).
; PLAN: r0=275(x1), r1=98(y1), r2=196(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 98
LDI r2, 196
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
