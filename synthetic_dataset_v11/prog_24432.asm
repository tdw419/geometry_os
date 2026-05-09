; DESCRIPTION: Draws a cyan line from (245, 161) to (113, 76).
; PLAN: r0=245(x1), r1=161(y1), r2=113(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 161
LDI r2, 113
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
