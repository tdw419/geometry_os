; DESCRIPTION: Composite: . Then Renders a white box of size 110x86 starting at (146, 6). Then Places a magenta dot at position (81, 5).
; PLAN: r0=146(x), r1=6(y), r2=110(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 110x86 starting at (146, 6).
; PLAN: r0=146(x), r1=6(y), r2=110(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 6
LDI r2, 110
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (81, 5).
; PLAN: r0=81(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
