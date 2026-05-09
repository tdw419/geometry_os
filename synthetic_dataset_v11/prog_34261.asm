; DESCRIPTION: Composite: . Then Places a blue dot at position (146, 163). Then Creates a red rectangular region at (130, 36) spanning 46 by 56 pixels.
; PLAN: r0=146(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=130(x), r1=36(y), r2=46(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (146, 163).
; PLAN: r0=146(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (130, 36) spanning 46 by 56 pixels.
; PLAN: r0=130(x), r1=36(y), r2=46(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 36
LDI r2, 46
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
