; DESCRIPTION: Draws a cyan line from (127, 214) to (205, 208).
; PLAN: r0=127(x1), r1=214(y1), r2=205(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 214
LDI r2, 205
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
