; DESCRIPTION: Places a cyan line segment connecting (154, 61) to (442, 206).
; PLAN: r0=154(x1), r1=61(y1), r2=442(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 61
LDI r2, 442
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
