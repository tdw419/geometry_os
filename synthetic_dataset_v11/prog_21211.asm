; DESCRIPTION: Places a yellow line segment connecting (120, 126) to (92, 228).
; PLAN: r0=120(x1), r1=126(y1), r2=92(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 126
LDI r2, 92
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
