; DESCRIPTION: Creates a orange rectangular region at (164, 129) spanning 113 by 52 pixels.
; PLAN: r0=164(x), r1=129(y), r2=113(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 129
LDI r2, 113
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
