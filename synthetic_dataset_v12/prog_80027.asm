; DESCRIPTION: Draws a white line from (113, 111) to (74, 198).
; PLAN: r0=113(x1), r1=111(y1), r2=74(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 111
LDI r2, 74
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
