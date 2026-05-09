; DESCRIPTION: Draws a white line from (354, 202) to (415, 128).
; PLAN: r0=354(x1), r1=202(y1), r2=415(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 202
LDI r2, 415
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
