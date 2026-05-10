; DESCRIPTION: Draws a white line from (420, 173) to (234, 204).
; PLAN: r0=420(x1), r1=173(y1), r2=234(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 173
LDI r2, 234
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
