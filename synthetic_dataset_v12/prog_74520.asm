; DESCRIPTION: Places a green line segment connecting (206, 237) to (228, 14).
; PLAN: r0=206(x1), r1=237(y1), r2=228(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 237
LDI r2, 228
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
