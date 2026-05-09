; DESCRIPTION: Composite: . Then Creates a green rectangular region at (107, 95) spanning 107 by 28 pixels. Then Sets a single black pixel at (54, 249).
; PLAN: r0=107(x), r1=95(y), r2=107(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (107, 95) spanning 107 by 28 pixels.
; PLAN: r0=107(x), r1=95(y), r2=107(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 95
LDI r2, 107
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (54, 249).
; PLAN: r0=54(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
HALT
