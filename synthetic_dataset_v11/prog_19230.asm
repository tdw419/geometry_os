; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (186, 107) spanning 57 by 26 pixels. Then Sets a single red pixel at (230, 168).
; PLAN: r0=186(x), r1=107(y), r2=57(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=230(x), r1=168(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (186, 107) spanning 57 by 26 pixels.
; PLAN: r0=186(x), r1=107(y), r2=57(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 107
LDI r2, 57
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (230, 168).
; PLAN: r0=230(x), r1=168(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 168
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
