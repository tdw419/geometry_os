; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (213, 7) spanning 39 by 13 pixels. Then Places a blue dot at position (25, 173).
; PLAN: r0=213(x), r1=7(y), r2=39(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=25(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange rectangular region at (213, 7) spanning 39 by 13 pixels.
; PLAN: r0=213(x), r1=7(y), r2=39(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 7
LDI r2, 39
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (25, 173).
; PLAN: r0=25(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
