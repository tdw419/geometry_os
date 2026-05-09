; DESCRIPTION: Renders a cyan line between points (60, 67) and (254, 186).
; PLAN: r0=60(x1), r1=67(y1), r2=254(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 67
LDI r2, 254
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
