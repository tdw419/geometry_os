; DESCRIPTION: Places a cyan line segment connecting (187, 38) to (126, 125).
; PLAN: r0=187(x1), r1=38(y1), r2=126(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 38
LDI r2, 126
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
