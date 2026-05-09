; DESCRIPTION: Draws a green line from (71, 238) to (167, 209).
; PLAN: r0=71(x1), r1=238(y1), r2=167(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 238
LDI r2, 167
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
