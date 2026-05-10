; DESCRIPTION: Draws a cyan line from (42, 115) to (299, 102).
; PLAN: r0=42(x1), r1=115(y1), r2=299(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 115
LDI r2, 299
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
