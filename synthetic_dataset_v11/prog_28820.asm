; DESCRIPTION: Composite: . Then Renders a cyan box of size 26x83 starting at (25, 66). Then Places a magenta dot at position (187, 252).
; PLAN: r0=25(x), r1=66(y), r2=26(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x), r1=252(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 26x83 starting at (25, 66).
; PLAN: r0=25(x), r1=66(y), r2=26(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 66
LDI r2, 26
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (187, 252).
; PLAN: r0=187(x), r1=252(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 252
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
