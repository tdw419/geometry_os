; DESCRIPTION: Places a green line segment connecting (228, 242) to (246, 113).
; PLAN: r0=228(x1), r1=242(y1), r2=246(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 242
LDI r2, 246
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
