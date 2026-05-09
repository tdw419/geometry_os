; DESCRIPTION: Composite: . Then Sets a single black pixel at (59, 198). Then Renders a green box of size 68x49 starting at (170, 42).
; PLAN: r0=59(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=170(x), r1=42(y), r2=68(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (59, 198).
; PLAN: r0=59(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 68x49 starting at (170, 42).
; PLAN: r0=170(x), r1=42(y), r2=68(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 42
LDI r2, 68
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
