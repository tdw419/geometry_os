; DESCRIPTION: Composite: . Then Renders a cyan box of size 28x86 starting at (218, 103). Then Sets a single green pixel at (189, 75).
; PLAN: r0=218(x), r1=103(y), r2=28(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 28x86 starting at (218, 103).
; PLAN: r0=218(x), r1=103(y), r2=28(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 103
LDI r2, 28
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (189, 75).
; PLAN: r0=189(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
