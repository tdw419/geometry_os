; DESCRIPTION: Places a cyan line segment connecting (384, 206) to (258, 120).
; PLAN: r0=384(x1), r1=206(y1), r2=258(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 206
LDI r2, 258
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
