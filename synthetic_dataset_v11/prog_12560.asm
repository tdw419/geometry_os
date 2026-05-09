; DESCRIPTION: Composite: . Then Places a magenta dot at position (23, 72). Then Renders a cyan box of size 96x86 starting at (160, 99).
; PLAN: r0=23(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=160(x), r1=99(y), r2=96(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (23, 72).
; PLAN: r0=23(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 72
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 96x86 starting at (160, 99).
; PLAN: r0=160(x), r1=99(y), r2=96(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 99
LDI r2, 96
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
