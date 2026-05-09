; DESCRIPTION: Creates a purple rectangular region at (91, 42) spanning 107 by 27 pixels.
; PLAN: r0=91(x), r1=42(y), r2=107(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 42
LDI r2, 107
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
