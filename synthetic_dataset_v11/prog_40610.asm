; DESCRIPTION: Composite: . Then Places a red line segment connecting (171, 96) to (32, 8). Then Places a yellow dot at position (113, 172).
; PLAN: r0=171(x1), r1=96(y1), r2=32(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=113(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (171, 96) to (32, 8).
; PLAN: r0=171(x1), r1=96(y1), r2=32(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 96
LDI r2, 32
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (113, 172).
; PLAN: r0=113(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
