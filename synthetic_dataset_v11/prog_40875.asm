; DESCRIPTION: Renders a cyan line between points (209, 134) and (82, 117).
; PLAN: r0=209(x1), r1=134(y1), r2=82(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 134
LDI r2, 82
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
