; DESCRIPTION: Draws a cyan line from (91, 42) to (50, 35).
; PLAN: r0=91(x1), r1=42(y1), r2=50(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 42
LDI r2, 50
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
