; DESCRIPTION: Draws a white line from (301, 57) to (168, 46).
; PLAN: r0=301(x1), r1=57(y1), r2=168(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 57
LDI r2, 168
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
