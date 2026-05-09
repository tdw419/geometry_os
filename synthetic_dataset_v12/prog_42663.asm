; DESCRIPTION: Places a cyan line segment connecting (144, 228) to (380, 168).
; PLAN: r0=144(x1), r1=228(y1), r2=380(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 228
LDI r2, 380
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
