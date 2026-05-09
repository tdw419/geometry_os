; DESCRIPTION: Composite: . Then Places a green dot at position (93, 54). Then Creates a orange rectangular region at (59, 67) spanning 90 by 109 pixels.
; PLAN: r0=93(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=59(x), r1=67(y), r2=90(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (93, 54).
; PLAN: r0=93(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (59, 67) spanning 90 by 109 pixels.
; PLAN: r0=59(x), r1=67(y), r2=90(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 67
LDI r2, 90
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
