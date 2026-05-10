; DESCRIPTION: Renders a cyan line segment connecting (221, 114) to (255, 60).
; PLAN: r0=221(x1), r1=114(y1), r2=255(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 114
LDI r2, 255
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
