; DESCRIPTION: Renders a orange rectangular region spanning 13 by 86 at (150, 186).
; PLAN: r0=150(x), r1=186(y), r2=13(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 186
LDI r2, 13
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
