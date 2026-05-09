; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (120, 132) spanning 59 by 71 pixels. Then Places a white dot at position (49, 187).
; PLAN: r0=120(x), r1=132(y), r2=59(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=49(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange rectangular region at (120, 132) spanning 59 by 71 pixels.
; PLAN: r0=120(x), r1=132(y), r2=59(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 132
LDI r2, 59
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (49, 187).
; PLAN: r0=49(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
