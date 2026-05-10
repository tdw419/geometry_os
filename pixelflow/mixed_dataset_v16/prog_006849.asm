; DESCRIPTION: Creates a red rectangular region at (24, 111) spanning 72 by 16 pixels.
; PLAN: r0=24(x), r1=111(y), r2=72(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 111
LDI r2, 72
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
