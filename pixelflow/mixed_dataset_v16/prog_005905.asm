; DESCRIPTION: Creates a red rectangular region at (428, 129) spanning 50 by 63 pixels.
; PLAN: r0=428(x), r1=129(y), r2=50(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 129
LDI r2, 50
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
