; DESCRIPTION: Renders a cyan line segment connecting (281, 42) to (233, 84).
; PLAN: r0=281(x1), r1=42(y1), r2=233(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 42
LDI r2, 233
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
