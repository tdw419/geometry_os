; DESCRIPTION: Draws a white line from (50, 117) to (405, 113).
; PLAN: r0=50(x1), r1=117(y1), r2=405(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 117
LDI r2, 405
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
