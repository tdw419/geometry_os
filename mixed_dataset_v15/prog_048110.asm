; DESCRIPTION: Draws a cyan line from (70, 27) to (406, 189).
; PLAN: r0=70(x1), r1=27(y1), r2=406(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 27
LDI r2, 406
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
