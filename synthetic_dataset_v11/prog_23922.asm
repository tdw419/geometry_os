; DESCRIPTION: Places a cyan line segment connecting (96, 40) to (42, 126).
; PLAN: r0=96(x1), r1=40(y1), r2=42(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 40
LDI r2, 42
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
