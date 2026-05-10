; DESCRIPTION: Renders a blue line between points (239, 73) and (307, 166).
; PLAN: r0=239(x1), r1=73(y1), r2=307(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 73
LDI r2, 307
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
