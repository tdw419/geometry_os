; DESCRIPTION: Renders a cyan line between points (446, 16) and (166, 53).
; PLAN: r0=446(x1), r1=16(y1), r2=166(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 16
LDI r2, 166
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
