; DESCRIPTION: Places a cyan line segment connecting (156, 239) to (165, 204).
; PLAN: r0=156(x1), r1=239(y1), r2=165(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 239
LDI r2, 165
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
