; DESCRIPTION: Places a cyan line segment connecting (105, 228) to (50, 68).
; PLAN: r0=105(x1), r1=228(y1), r2=50(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 228
LDI r2, 50
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
