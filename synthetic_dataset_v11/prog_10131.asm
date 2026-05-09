; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (198, 43). Then Renders a cyan box of size 113x10 starting at (2, 36).
; PLAN: r0=198(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=2(x), r1=36(y), r2=113(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (198, 43).
; PLAN: r0=198(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 113x10 starting at (2, 36).
; PLAN: r0=2(x), r1=36(y), r2=113(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 36
LDI r2, 113
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
