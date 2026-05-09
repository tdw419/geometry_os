; DESCRIPTION: Creates a magenta rectangular region at (4, 129) spanning 103 by 107 pixels.
; PLAN: r0=4(x), r1=129(y), r2=103(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 129
LDI r2, 103
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
