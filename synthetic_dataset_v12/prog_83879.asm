; DESCRIPTION: Renders a cyan line between points (324, 67) and (15, 146).
; PLAN: r0=324(x1), r1=67(y1), r2=15(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 67
LDI r2, 15
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
