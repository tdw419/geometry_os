; DESCRIPTION: Draws a black line from (499, 210) to (415, 214).
; PLAN: r0=499(x1), r1=210(y1), r2=415(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 210
LDI r2, 415
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
