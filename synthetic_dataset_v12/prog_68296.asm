; DESCRIPTION: Places a yellow line segment connecting (265, 221) to (220, 228).
; PLAN: r0=265(x1), r1=221(y1), r2=220(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 221
LDI r2, 220
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
