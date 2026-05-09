; DESCRIPTION: Places a cyan line segment connecting (384, 150) to (145, 113).
; PLAN: r0=384(x1), r1=150(y1), r2=145(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 150
LDI r2, 145
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
