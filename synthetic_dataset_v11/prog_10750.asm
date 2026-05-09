; DESCRIPTION: Places a cyan line segment connecting (200, 228) to (239, 198).
; PLAN: r0=200(x1), r1=228(y1), r2=239(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 228
LDI r2, 239
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
