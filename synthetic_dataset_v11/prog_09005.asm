; DESCRIPTION: Composite: . Then Places a magenta dot at position (253, 120). Then Renders a orange box of size 42x118 starting at (136, 103).
; PLAN: r0=253(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=103(y), r2=42(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (253, 120).
; PLAN: r0=253(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 42x118 starting at (136, 103).
; PLAN: r0=136(x), r1=103(y), r2=42(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 103
LDI r2, 42
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
