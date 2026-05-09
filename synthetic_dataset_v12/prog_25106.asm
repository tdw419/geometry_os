; DESCRIPTION: Renders a cyan line between points (430, 210) and (175, 171).
; PLAN: r0=430(x1), r1=210(y1), r2=175(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 210
LDI r2, 175
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
