; DESCRIPTION: Draws a cyan line from (168, 86) to (244, 205).
; PLAN: r0=168(x1), r1=86(y1), r2=244(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 86
LDI r2, 244
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
