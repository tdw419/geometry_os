; DESCRIPTION: Composite: . Then Creates a red circular shape at (116, 135) with radius 69. Then Places a cyan line segment connecting (220, 79) to (164, 25).
; PLAN: r0=116(x), r1=135(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=220(x1), r1=79(y1), r2=164(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (116, 135) with radius 69.
; PLAN: r0=116(x), r1=135(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 135
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (220, 79) to (164, 25).
; PLAN: r0=220(x1), r1=79(y1), r2=164(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 79
LDI r2, 164
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
