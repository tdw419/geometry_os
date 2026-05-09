; DESCRIPTION: Composite: . Then Creates a white rectangular region at (146, 115) spanning 69 by 34 pixels. Then Places a orange dot at position (93, 39).
; PLAN: r0=146(x), r1=115(y), r2=69(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (146, 115) spanning 69 by 34 pixels.
; PLAN: r0=146(x), r1=115(y), r2=69(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 115
LDI r2, 69
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (93, 39).
; PLAN: r0=93(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
