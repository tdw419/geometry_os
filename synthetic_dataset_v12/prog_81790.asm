; DESCRIPTION: Creates a red rectangular region at (50, 71) spanning 107 by 111 pixels.
; PLAN: r0=50(x), r1=71(y), r2=107(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 71
LDI r2, 107
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
