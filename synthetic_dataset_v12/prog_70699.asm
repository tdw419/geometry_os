; DESCRIPTION: Draws a green line from (215, 209) to (9, 167).
; PLAN: r0=215(x1), r1=209(y1), r2=9(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 209
LDI r2, 9
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
