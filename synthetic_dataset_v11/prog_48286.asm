; DESCRIPTION: Composite: . Then Places a green line segment connecting (46, 112) to (28, 215). Then Places a red dot at position (117, 221).
; PLAN: r0=46(x1), r1=112(y1), r2=28(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (46, 112) to (28, 215).
; PLAN: r0=46(x1), r1=112(y1), r2=28(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 112
LDI r2, 28
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (117, 221).
; PLAN: r0=117(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
