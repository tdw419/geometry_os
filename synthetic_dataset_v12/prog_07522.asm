; DESCRIPTION: Draws a white line from (298, 33) to (481, 174).
; PLAN: r0=298(x1), r1=33(y1), r2=481(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 33
LDI r2, 481
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
