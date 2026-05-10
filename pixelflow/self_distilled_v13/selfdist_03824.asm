; DESCRIPTION: Draws a green line from (59, 27) to (3, 146).
; PLAN: r0=59(x1), r1=27(y1), r2=3(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 27
LDI r2, 3
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
