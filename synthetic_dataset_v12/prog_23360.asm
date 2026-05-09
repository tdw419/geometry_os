; DESCRIPTION: Places a cyan line segment connecting (56, 245) to (446, 43).
; PLAN: r0=56(x1), r1=245(y1), r2=446(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 245
LDI r2, 446
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
