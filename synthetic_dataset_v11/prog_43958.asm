; DESCRIPTION: Composite: . Then Places a orange dot at position (113, 76). Then Creates a orange rectangular region at (6, 146) spanning 20 by 54 pixels.
; PLAN: r0=113(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=6(x), r1=146(y), r2=20(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (113, 76).
; PLAN: r0=113(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (6, 146) spanning 20 by 54 pixels.
; PLAN: r0=6(x), r1=146(y), r2=20(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 146
LDI r2, 20
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
