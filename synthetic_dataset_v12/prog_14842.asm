; DESCRIPTION: Creates a red rectangular region at (111, 84) spanning 113 by 82 pixels.
; PLAN: r0=111(x), r1=84(y), r2=113(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 84
LDI r2, 113
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
