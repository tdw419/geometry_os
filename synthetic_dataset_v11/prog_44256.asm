; DESCRIPTION: Composite: . Then Places a blue 30x92 rectangle at position (50, 63). Then Places a green line segment connecting (77, 242) to (171, 236).
; PLAN: r0=50(x), r1=63(y), r2=30(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=77(x1), r1=242(y1), r2=171(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 30x92 rectangle at position (50, 63).
; PLAN: r0=50(x), r1=63(y), r2=30(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 63
LDI r2, 30
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (77, 242) to (171, 236).
; PLAN: r0=77(x1), r1=242(y1), r2=171(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 242
LDI r2, 171
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
