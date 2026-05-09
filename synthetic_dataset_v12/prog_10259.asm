; DESCRIPTION: Creates a red rectangular region at (176, 50) spanning 86 by 111 pixels.
; PLAN: r0=176(x), r1=50(y), r2=86(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 50
LDI r2, 86
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
