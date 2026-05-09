; DESCRIPTION: Composite: . Then Creates a white rectangular region at (61, 52) spanning 72 by 69 pixels. Then Places a white dot at position (34, 235).
; PLAN: r0=61(x), r1=52(y), r2=72(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=34(x), r1=235(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (61, 52) spanning 72 by 69 pixels.
; PLAN: r0=61(x), r1=52(y), r2=72(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 52
LDI r2, 72
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (34, 235).
; PLAN: r0=34(x), r1=235(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 235
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
