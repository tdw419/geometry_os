; DESCRIPTION: Renders a cyan line segment connecting (14, 12) to (42, 9).
; PLAN: r0=14(x1), r1=12(y1), r2=42(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 12
LDI r2, 42
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
