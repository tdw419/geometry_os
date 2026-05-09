; DESCRIPTION: Places a cyan line segment connecting (82, 42) to (106, 231).
; PLAN: r0=82(x1), r1=42(y1), r2=106(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 42
LDI r2, 106
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
