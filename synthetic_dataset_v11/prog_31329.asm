; DESCRIPTION: Creates a green rectangular region at (168, 69) spanning 82 by 60 pixels.
; PLAN: r0=168(x), r1=69(y), r2=82(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 69
LDI r2, 82
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
