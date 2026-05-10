; DESCRIPTION: Renders a cyan line between points (215, 32) and (123, 200).
; PLAN: r0=215(x1), r1=32(y1), r2=123(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 32
LDI r2, 123
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
