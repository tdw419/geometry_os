; DESCRIPTION: Places a cyan line segment connecting (42, 75) to (489, 173).
; PLAN: r0=42(x1), r1=75(y1), r2=489(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 75
LDI r2, 489
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
