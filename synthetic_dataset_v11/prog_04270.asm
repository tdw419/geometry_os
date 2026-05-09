; DESCRIPTION: Creates a white rectangular region at (146, 67) spanning 75 by 113 pixels.
; PLAN: r0=146(x), r1=67(y), r2=75(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 67
LDI r2, 75
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
