; DESCRIPTION: Places a cyan line segment connecting (509, 57) to (265, 46).
; PLAN: r0=509(x1), r1=57(y1), r2=265(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 57
LDI r2, 265
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
