; DESCRIPTION: Draws a magenta line from (446, 20) to (281, 29).
; PLAN: r0=446(x1), r1=20(y1), r2=281(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 20
LDI r2, 281
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
