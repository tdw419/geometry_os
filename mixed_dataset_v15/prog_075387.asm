; DESCRIPTION: Renders a green rectangular region spanning 42 by 66 at (254, 174).
; PLAN: r0=254(x), r1=174(y), r2=42(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 174
LDI r2, 42
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
