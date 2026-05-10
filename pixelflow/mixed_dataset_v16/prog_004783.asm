; DESCRIPTION: Places a cyan line segment connecting (365, 122) to (123, 42).
; PLAN: r0=365(x1), r1=122(y1), r2=123(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 122
LDI r2, 123
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
