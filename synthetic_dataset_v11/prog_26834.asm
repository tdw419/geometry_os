; DESCRIPTION: Draws a cyan line from (42, 50) to (108, 99).
; PLAN: r0=42(x1), r1=50(y1), r2=108(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 50
LDI r2, 108
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
