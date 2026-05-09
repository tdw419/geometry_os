; DESCRIPTION: Creates a red rectangular region at (376, 171) spanning 21 by 42 pixels.
; PLAN: r0=376(x), r1=171(y), r2=21(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 171
LDI r2, 21
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
