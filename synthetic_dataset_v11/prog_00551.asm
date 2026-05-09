; DESCRIPTION: Creates a red rectangular region at (109, 103) spanning 111 by 27 pixels.
; PLAN: r0=109(x), r1=103(y), r2=111(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 103
LDI r2, 111
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
