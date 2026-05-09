; DESCRIPTION: Draws a white line from (196, 186) to (283, 228).
; PLAN: r0=196(x1), r1=186(y1), r2=283(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 186
LDI r2, 283
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
