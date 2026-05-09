; DESCRIPTION: Places a cyan line segment connecting (172, 172) to (113, 42).
; PLAN: r0=172(x1), r1=172(y1), r2=113(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 172
LDI r2, 113
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
