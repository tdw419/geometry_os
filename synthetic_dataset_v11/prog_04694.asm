; DESCRIPTION: Composite: . Then Renders a cyan box of size 79x16 starting at (118, 122). Then Places a black line segment connecting (98, 255) to (255, 255).
; PLAN: r0=118(x), r1=122(y), r2=79(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=98(x1), r1=255(y1), r2=255(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 79x16 starting at (118, 122).
; PLAN: r0=118(x), r1=122(y), r2=79(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 122
LDI r2, 79
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (98, 255) to (255, 255).
; PLAN: r0=98(x1), r1=255(y1), r2=255(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 255
LDI r2, 255
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
