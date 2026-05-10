; DESCRIPTION: Draws a yellow line from (280, 16) to (295, 71).
; PLAN: r0=280(x1), r1=16(y1), r2=295(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 16
LDI r2, 295
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
