; DESCRIPTION: Draws a blue line from (443, 215) to (499, 8).
; PLAN: r0=443(x1), r1=215(y1), r2=499(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 215
LDI r2, 499
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
