; DESCRIPTION: Places a green line segment connecting (404, 239) to (467, 196).
; PLAN: r0=404(x1), r1=239(y1), r2=467(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 239
LDI r2, 467
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
