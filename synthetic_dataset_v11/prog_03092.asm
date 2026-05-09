; DESCRIPTION: Composite: . Then Renders a cyan box of size 34x66 starting at (78, 27). Then Sets a single red pixel at (150, 243).
; PLAN: r0=78(x), r1=27(y), r2=34(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 34x66 starting at (78, 27).
; PLAN: r0=78(x), r1=27(y), r2=34(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 27
LDI r2, 34
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (150, 243).
; PLAN: r0=150(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 243
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
