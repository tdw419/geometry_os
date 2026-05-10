; DESCRIPTION: Renders a cyan rectangular region spanning 63 by 39 at (2, 171).
; PLAN: r0=2(x), r1=171(y), r2=63(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 171
LDI r2, 63
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
