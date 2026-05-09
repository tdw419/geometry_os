; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (27, 59) spanning 22 by 94 pixels. Then Sets a single purple pixel at (22, 37).
; PLAN: r0=27(x), r1=59(y), r2=22(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=22(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (27, 59) spanning 22 by 94 pixels.
; PLAN: r0=27(x), r1=59(y), r2=22(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 59
LDI r2, 22
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (22, 37).
; PLAN: r0=22(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
