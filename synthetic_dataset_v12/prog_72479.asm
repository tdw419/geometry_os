; DESCRIPTION: Places a cyan line segment connecting (191, 160) to (33, 228).
; PLAN: r0=191(x1), r1=160(y1), r2=33(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 160
LDI r2, 33
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
