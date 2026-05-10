; DESCRIPTION: Places a cyan line segment connecting (286, 189) to (128, 166).
; PLAN: r0=286(x1), r1=189(y1), r2=128(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 189
LDI r2, 128
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
