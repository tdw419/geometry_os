; DESCRIPTION: Places a yellow line segment connecting (228, 255) to (498, 134).
; PLAN: r0=228(x1), r1=255(y1), r2=498(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 255
LDI r2, 498
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
