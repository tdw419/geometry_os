; DESCRIPTION: Creates a red rectangular region at (126, 71) spanning 75 by 59 pixels.
; PLAN: r0=126(x), r1=71(y), r2=75(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 71
LDI r2, 75
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
