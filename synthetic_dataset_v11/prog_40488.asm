; DESCRIPTION: Places a cyan line segment connecting (127, 27) to (111, 12).
; PLAN: r0=127(x1), r1=27(y1), r2=111(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 27
LDI r2, 111
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
