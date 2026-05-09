; DESCRIPTION: Draws a black line from (245, 171) to (479, 150).
; PLAN: r0=245(x1), r1=171(y1), r2=479(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 171
LDI r2, 479
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
