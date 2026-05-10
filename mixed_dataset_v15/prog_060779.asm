; DESCRIPTION: Draws a white line from (213, 33) to (320, 140).
; PLAN: r0=213(x1), r1=33(y1), r2=320(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 33
LDI r2, 320
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
