; DESCRIPTION: Renders a cyan line segment connecting (2, 103) to (386, 63).
; PLAN: r0=2(x1), r1=103(y1), r2=386(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 103
LDI r2, 386
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
