; DESCRIPTION: Renders a cyan line segment connecting (69, 82) to (210, 6).
; PLAN: r0=69(x1), r1=82(y1), r2=210(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 82
LDI r2, 210
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
