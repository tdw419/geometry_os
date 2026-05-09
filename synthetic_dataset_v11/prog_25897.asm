; DESCRIPTION: Composite: . Then Sets a single blue pixel at (119, 204). Then Places a green line segment connecting (48, 195) to (152, 184).
; PLAN: r0=119(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=48(x1), r1=195(y1), r2=152(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (119, 204).
; PLAN: r0=119(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (48, 195) to (152, 184).
; PLAN: r0=48(x1), r1=195(y1), r2=152(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 195
LDI r2, 152
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
