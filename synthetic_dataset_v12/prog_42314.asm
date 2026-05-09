; DESCRIPTION: Draws a magenta line from (509, 196) to (295, 237).
; PLAN: r0=509(x1), r1=196(y1), r2=295(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 196
LDI r2, 295
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
