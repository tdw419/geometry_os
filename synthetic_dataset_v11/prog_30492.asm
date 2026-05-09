; DESCRIPTION: Places a cyan line segment connecting (187, 115) to (42, 199).
; PLAN: r0=187(x1), r1=115(y1), r2=42(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 115
LDI r2, 42
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
