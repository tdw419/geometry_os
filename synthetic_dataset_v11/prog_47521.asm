; DESCRIPTION: Composite: . Then Creates a black rectangular region at (42, 87) spanning 109 by 29 pixels. Then Sets a single black pixel at (112, 8).
; PLAN: r0=42(x), r1=87(y), r2=109(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (42, 87) spanning 109 by 29 pixels.
; PLAN: r0=42(x), r1=87(y), r2=109(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 87
LDI r2, 109
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (112, 8).
; PLAN: r0=112(x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 8
LDI r2, 0x000000
PSET r0, r1, r2
HALT
