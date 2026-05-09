; DESCRIPTION: Composite: . Then Places a magenta dot at position (119, 120). Then Renders a cyan box of size 16x91 starting at (209, 99).
; PLAN: r0=119(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=209(x), r1=99(y), r2=16(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (119, 120).
; PLAN: r0=119(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 16x91 starting at (209, 99).
; PLAN: r0=209(x), r1=99(y), r2=16(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 99
LDI r2, 16
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
