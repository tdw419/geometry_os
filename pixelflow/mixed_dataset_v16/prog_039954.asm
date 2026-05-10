; DESCRIPTION: Draws a white line from (356, 168) to (329, 228).
; PLAN: r0=356(x1), r1=168(y1), r2=329(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 168
LDI r2, 329
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
