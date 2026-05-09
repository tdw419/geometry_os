; DESCRIPTION: Draws a white line from (255, 143) to (469, 174).
; PLAN: r0=255(x1), r1=143(y1), r2=469(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 143
LDI r2, 469
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
