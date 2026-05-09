; DESCRIPTION: Draws a white line from (310, 174) to (320, 117).
; PLAN: r0=310(x1), r1=174(y1), r2=320(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 174
LDI r2, 320
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
