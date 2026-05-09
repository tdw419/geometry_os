; DESCRIPTION: Renders a cyan line between points (72, 215) and (113, 205).
; PLAN: r0=72(x1), r1=215(y1), r2=113(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 215
LDI r2, 113
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
