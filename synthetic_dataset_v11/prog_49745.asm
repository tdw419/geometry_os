; DESCRIPTION: Composite: . Then Places a red 114x71 rectangle at position (87, 169). Then Sets a single white pixel at (56, 133).
; PLAN: r0=87(x), r1=169(y), r2=114(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=56(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 114x71 rectangle at position (87, 169).
; PLAN: r0=87(x), r1=169(y), r2=114(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 114
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (56, 133).
; PLAN: r0=56(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
