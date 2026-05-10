; DESCRIPTION: Places a cyan line segment connecting (107, 27) to (105, 55).
; PLAN: r0=107(x1), r1=27(y1), r2=105(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 27
LDI r2, 105
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
