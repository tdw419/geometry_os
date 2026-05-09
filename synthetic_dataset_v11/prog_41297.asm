; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (214, 125) to (69, 181). Then Sets a single cyan pixel at (54, 224).
; PLAN: r0=214(x1), r1=125(y1), r2=69(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (214, 125) to (69, 181).
; PLAN: r0=214(x1), r1=125(y1), r2=69(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 125
LDI r2, 69
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (54, 224).
; PLAN: r0=54(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
