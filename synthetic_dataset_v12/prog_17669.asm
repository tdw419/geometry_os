; DESCRIPTION: Renders a cyan line between points (160, 210) and (30, 204).
; PLAN: r0=160(x1), r1=210(y1), r2=30(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 210
LDI r2, 30
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
