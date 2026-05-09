; DESCRIPTION: Draws a green line from (487, 69) to (405, 174).
; PLAN: r0=487(x1), r1=69(y1), r2=405(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 69
LDI r2, 405
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
