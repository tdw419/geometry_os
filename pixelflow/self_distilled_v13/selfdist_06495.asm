; DESCRIPTION: Renders a orange rectangular region spanning 50 by 14 at (267, 143).
; PLAN: r0=267(x), r1=143(y), r2=50(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 143
LDI r2, 50
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
