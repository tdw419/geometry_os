; DESCRIPTION: Places a green line segment connecting (243, 239) to (1, 228).
; PLAN: r0=243(x1), r1=239(y1), r2=1(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 239
LDI r2, 1
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
