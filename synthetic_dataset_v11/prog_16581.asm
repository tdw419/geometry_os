; DESCRIPTION: Composite: . Then Sets a single purple pixel at (82, 61). Then Renders a red box of size 39x56 starting at (50, 193).
; PLAN: r0=82(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=50(x), r1=193(y), r2=39(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (82, 61).
; PLAN: r0=82(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 39x56 starting at (50, 193).
; PLAN: r0=50(x), r1=193(y), r2=39(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 193
LDI r2, 39
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
