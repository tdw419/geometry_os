; DESCRIPTION: Places a cyan line segment connecting (295, 125) to (258, 42).
; PLAN: r0=295(x1), r1=125(y1), r2=258(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 125
LDI r2, 258
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
