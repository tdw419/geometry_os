; DESCRIPTION: Renders a cyan line between points (503, 25) and (68, 103).
; PLAN: r0=503(x1), r1=25(y1), r2=68(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 25
LDI r2, 68
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
