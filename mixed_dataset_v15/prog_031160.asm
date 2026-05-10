; DESCRIPTION: Renders a green line between points (479, 178) and (262, 41).
; PLAN: r0=479(x1), r1=178(y1), r2=262(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 178
LDI r2, 262
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
