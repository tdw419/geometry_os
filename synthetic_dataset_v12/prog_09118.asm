; DESCRIPTION: Places a cyan line segment connecting (267, 221) to (0, 108).
; PLAN: r0=267(x1), r1=221(y1), r2=0(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 221
LDI r2, 0
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
