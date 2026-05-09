; DESCRIPTION: Creates a magenta rectangular region at (294, 126) spanning 82 by 36 pixels.
; PLAN: r0=294(x), r1=126(y), r2=82(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 126
LDI r2, 82
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
