; DESCRIPTION: Creates a magenta rectangular region at (380, 111) spanning 82 by 10 pixels.
; PLAN: r0=380(x), r1=111(y), r2=82(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 111
LDI r2, 82
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
