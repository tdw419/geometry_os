; DESCRIPTION: Renders a cyan line between points (87, 171) and (485, 43).
; PLAN: r0=87(x1), r1=171(y1), r2=485(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 171
LDI r2, 485
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
