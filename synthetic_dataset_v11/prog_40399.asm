; DESCRIPTION: Renders a white line between points (171, 210) and (215, 52).
; PLAN: r0=171(x1), r1=210(y1), r2=215(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 210
LDI r2, 215
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
